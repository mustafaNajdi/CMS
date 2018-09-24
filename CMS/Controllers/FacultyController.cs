using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CMS.Models;

namespace CMS.Controllers
{
    public class FacultyController : Controller
    {
        CMSdb Context = new CMSdb();
        // GET: Faculty
        public ActionResult Index()
        {
            List<Faculty> Fcl = new List<Faculty>();
            Fcl = Context.Faculties.ToList();
            return View(Fcl);
        }
        public ActionResult BatchIndex()
        {
            return View();
        }
        public ActionResult CreateFaculty()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CreateFaculty(Faculty Fcl)
        {
            Context.Faculties.Add(Fcl);
            Context.SaveChanges();
            TempData["Feedback"] = Fcl.Name +  " has been added successfully";
            return RedirectToAction("Index");
        }
        public ActionResult CreateBatch()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CreateBatch(Batch Bt)
        {
            Context.Batches.Add(Bt);
            Context.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult EditFaculty(int Id)
        {
            Faculty Fcl = Context.Faculties.Find(Id);
            return View(Fcl);
        }
        [HttpPost]
        public ActionResult EditFaculty(Faculty Fcl)
        {
            Context.Entry(Fcl).State = System.Data.Entity.EntityState.Modified;
            Context.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}