using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CMS.Models;

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
            return View();
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
        public JsonResult CheckCode(int Code,int StudentId)
        {
            StudentTemporaryUrl temporaryUrl = db.StudentTemporaryUrls.Where(c => c.StudentId == StudentId).LastOrDefault();
            if (temporaryUrl.ShortCode== Code && temporaryUrl.Expires>DateTime.Now && temporaryUrl.IsUsed!=true)
            {
                temporaryUrl.IsUsed = true;
                db.Entry(temporaryUrl).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                Student student = db.Students.Where(s => s.Id == StudentId).FirstOrDefault();
                return Json(student, JsonRequestBehavior.AllowGet);            
            }
            else
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }
        }
    }
}