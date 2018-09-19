using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CMS.Models;

namespace CMS.Controllers
{
    public class CertificateController : Controller
    {
        CMSdb Context = new CMSdb();
        // GET: Certificate
        public ActionResult Index()
        {
            List<CertificateType> Cer = new List<CertificateType>();

            Cer = Context.CertificateTypes.ToList();

            return View(Cer);
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(CertificateType Cer)
        {
            Context.CertificateTypes.Add(Cer);
            Context.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Edit(int Id)
        {
            
            CertificateType Cer = Context.CertificateTypes.Find(Id);
            return View(Cer);
        }
        [HttpPost]
        public ActionResult Edit(CertificateType cer)
        {
            
            Context.Entry(cer).State = System.Data.Entity.EntityState.Modified;
            Context.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Delete()
        {
            return View();
        }
    }
}