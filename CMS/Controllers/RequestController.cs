using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CMS.Models;
using System.IO;
using System.IO.Ports;

namespace CMS.Controllers
{
    
    public class RequestController : Controller
    {
        CMSdb db = new CMSdb();
        private const string SERIAL_PORT_NAME = "COM4";

        private static SerialPort _modemConnection;
        // GET: Request
        public ActionResult Index()
        {          
            return View();
        }
        public void SendSms(string Phone, string Msg)
        {
            _modemConnection.WriteLine("ATE0");
            var response = _modemConnection.ReadExisting();

            // Set text mode
            _modemConnection.WriteLine("AT+CMGF=1");
            response = _modemConnection.ReadExisting();

            // Send the SMS
            _modemConnection.WriteLine(String.Format
               ("AT+CMGS=\"{0}\"", Phone));
            response = _modemConnection.ReadExisting();

            _modemConnection.Write(Msg);
            _modemConnection.Write(new byte[] { 26 }, 0, 1);

            response = _modemConnection.ReadExisting();

            if (response.Contains("ERROR"))
            {
                Console.WriteLine("SMS Failed to send");
            }
            else
            {
                Console.WriteLine("SMS Sent");
                Console.WriteLine("Response: {0}", response);
            }
        }
        public ActionResult SendMesg()
        {
            return View();
        }
        [HttpPost]
        public ActionResult SendMesg(FormCollection fm)
        {
            _modemConnection = new SerialPort(SERIAL_PORT_NAME)
            {
                // 19200 baud, most modems will accept everything
                // from 9600 up to 115200
                BaudRate = 19200,
                // 99% of the time the port connection will be
                //8 Data bits
                DataBits = 8,
                // NO partiy
                Parity = Parity.None,
                // and 1 stop bit. Check your modem manual if
                // this doesn't work
                StopBits = StopBits.One
            };
            _modemConnection.Open();

            SendSms(fm["number"], fm["msg"]);

            _modemConnection.Close();
            return View();
        }
        public ActionResult Create()
        {
            ViewBag.Certificates = db.CertificateTypes.Where(c => c.IsDeleted != true).ToList();
            ViewBag.Delivery = db.DeliveryTypes.Where(d => d.IsDeleted != true).ToList();
            return View();
        }       
        [HttpPost]
        public ActionResult Create(HttpPostedFileBase file, FormCollection fm)
        {
            if(file.ContentLength>0)
            {
                string _FileName = Path.GetFileName(file.FileName);
                string _path = Path.Combine(Server.MapPath("~/Content/images"), _FileName);
                file.SaveAs(_path);
                int x = int.Parse(fm["StudentId"]);
                Student stu = db.Students.Where(s => s.Id == x).FirstOrDefault();
                stu.PhotoPath = "~/Content/images/" + _FileName;
                db.Entry(stu).State = System.Data.Entity.EntityState.Modified;
                int count = db.CertificateTypes.Where(c => c.IsDeleted != true).Count();
                Request request = new Request{
                    DeliveryId = int.Parse(fm["DeliveryId"]),
                    StudentId = int.Parse(fm["StudentId"]),
                    TotalPrice = int.Parse(fm["TotalPriceHidden"]),
                    DeliveryAddress = fm["DeliveryAddress"] != null ? fm["DeliveryAddress"] : null,
                    CreatedDate=DateTime.Now,
                    UpdatedDate=DateTime.Now
                };
                db.Requests.Add(request);
                db.SaveChanges();
                

                for (int i = 1; i <= count; i++)
                {
                    Request_Certificate request_Certificate = new Request_Certificate();
                    if (fm["CertificateId[" + i +"]"]!=null)
                    {
                        request_Certificate.Quantity = int.Parse(fm["Qty[" + i + "]"]);
                        request_Certificate.CertificateId = int.Parse(fm["CertificateId[" + i + "]"]);
                        request_Certificate.CreatedDate = DateTime.Now;
                        request_Certificate.ReqId = request.Id;
                        db.Request_Certificate.Add(request_Certificate);
                    }
                }
                db.SaveChanges();
                return RedirectToAction("RequestPayment", new { id = request.Id });
            }
            return View();
           
        } 
        public ActionResult RequestPayment(int id)
        {
            Payment payment = new Payment();
            payment.Amount = db.Requests.Where(p => p.Id == id).Select(s => s.TotalPrice).FirstOrDefault();
            return View(payment);
        }
        [HttpPost]
        public ActionResult RequestPayment(int id,Payment payment)
        {
            Request request = db.Requests.Find(id);
            payment.ReqId = request.Id;
            payment.CreatedDate = DateTime.Now;
            db.Payments.Add(payment);
            request.IsPaid = true;
            db.SaveChanges();
            return RedirectToAction("ViewRequests",new {id=request.StudentId });
        }
        public ActionResult ViewRequests(int id)
        {
            return View(db.Requests.Where(r => r.StudentId == id).OrderByDescending(o => o.UpdatedDate).ToList());
        }

        public JsonResult CheckPhone(string PhoneNumber)
        {
            if(db.Students.Where(s=>s.PhoneNumber==PhoneNumber).Count()>0)
            {
                int StudentId = db.Students.Where(s => s.PhoneNumber == PhoneNumber).Select(p => p.Id).FirstOrDefault();
                int shortcode = StudentId;
                Random rnd = new Random();
                shortcode += rnd.Next(1000, 9999);
                StudentTemporaryUrl temporaryUrl = new StudentTemporaryUrl();
                temporaryUrl.StudentId = StudentId;
                temporaryUrl.ShortCode = int.Parse((shortcode.ToString()).Substring(0,4));
                temporaryUrl.Generated = DateTime.Now;
                temporaryUrl.Expires = DateTime.Now.AddHours(24);
                db.StudentTemporaryUrls.Add(temporaryUrl);
                db.SaveChanges();
                return Json(StudentId, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }
        }    
        public JsonResult AjaxViewRequest(string PhoneNumber)
        {
            if (db.Students.Where(s => s.PhoneNumber == PhoneNumber).Count() > 0)
            {
                int StudentId = db.Students.Where(s => s.PhoneNumber == PhoneNumber).Select(p => p.Id).FirstOrDefault();

                return Json(StudentId, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }
        }
        [HttpPost]
        public ActionResult CheckCode(int Code,int StudentId)
        {
            ViewBag.Certificates = db.CertificateTypes.Where(c => c.IsDeleted != true).ToList();
            ViewBag.Delivery = db.DeliveryTypes.Where(d => d.IsDeleted != true).ToList();
            StudentTemporaryUrl temporaryUrl = db.StudentTemporaryUrls.Where(c => c.StudentId == StudentId).OrderByDescending(s=>s.Generated).FirstOrDefault();
            if (temporaryUrl.ShortCode== Code && temporaryUrl.Expires>DateTime.Now && temporaryUrl.IsUsed!=true)
            {
                temporaryUrl.IsUsed = true;
                db.Entry(temporaryUrl).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                Student student = db.Students.Where(s => s.Id == StudentId).FirstOrDefault();
                StudentRequestViewModelcs modelcs = new StudentRequestViewModelcs();
                modelcs.Student = student;
                return PartialView("_StudentRequest", modelcs);
            }
            else
            {
                return Json(false,JsonRequestBehavior.AllowGet);
            }
        }
    }    
}