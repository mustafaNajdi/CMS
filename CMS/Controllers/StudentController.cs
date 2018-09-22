using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CMS.Models;

namespace CMS.Controllers
{
    public class StudentController : Controller
    {
        CMSdb Context = new CMSdb();
        // GET: Student
        public ActionResult Index()
        {
            List<Student> students = new List<Student>();
            students = Context.Students.ToList();
            return View(students);
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Student stu)
        {
            stu.CreatedDate = DateTime.Now;
            Context.Students.Add(stu);
            Context.SaveChanges();
            TempData["Feedback"] = stu.FirstName + " " + stu.LastName + " has been added successfully";
            return RedirectToAction("Index");
        }
        public ActionResult Edit(int Id)
        {
            Student stu = Context.Students.Find(Id);
            return View(stu);
        }
        [HttpPost]
        public ActionResult Edit(Student stu)
        {
            Context.Entry(stu).State = System.Data.Entity.EntityState.Modified;
            Context.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}