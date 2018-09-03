using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CMSMU.Models;

namespace CMSMU.Controllers
{
    public class StudentController : Controller
    {
        CMSdb context = new CMSdb();
        // GET: Student
        public ActionResult Index()
        {
            List<Student> students = new List<Student>();
           
            students= context.Students.ToList();
        
            return View(students);
        }
        public ActionResult Create() {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Student stu)
        {
            context.Students.Add(stu);
            context.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Edit(int Id)
        {
            Student stu = context.Students.Find(Id);
            return View(stu);
        }
        [HttpPost]
        public ActionResult Edit(Student stu)
        {
            stu.Id = 3;
            context.Entry(stu).State = System.Data.Entity.EntityState.Modified;
            context.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Delete(int Id)
        {
            Student stu = context.Students.Find(Id);
            context.Students.Remove(stu);
            context.SaveChanges();
            return RedirectToAction("Index");
        }
    }

}