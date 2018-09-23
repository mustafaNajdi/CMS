using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CMS.Models;
using System.IO;

namespace CMS.Controllers
{
    
    public class RequestController : Controller
    {
        CMSdb db = new CMSdb();
        
        // GET: Request
        public ActionResult Index()
        {          
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
                Student stu = db.Students.Where(s => s.Id == int.Parse(fm["StudentId"])).FirstOrDefault();
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
                Request_Certificate request_Certificate = new Request_Certificate();

                for (int i = 1; i <= count; i++)
                {                   
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
            return RedirectToAction("ViewRequests",new {id=request.Id });
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
                return View();
            }
        }
    }
}