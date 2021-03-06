﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CMS.Models;
using System.IO;

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
            ViewBag.Faculties = new SelectList(Context.Faculties.Where(r => r.IsDeleted != true).ToList(), "Id", "Name");

            return View();
        }
        [HttpPost]
        public ActionResult Create(Student stu,HttpPostedFileBase File)
        {
            ViewBag.Faculties = new SelectList(Context.Faculties.Where(r => r.IsDeleted != true).ToList(), "Id", "Name");

            if (File != null)
            {
                string pic = System.IO.Path.GetFileName(File.FileName);
                string path = System.IO.Path.Combine(Server.MapPath("~/Content/images"), pic);
                File.SaveAs(path);
            }
            stu.PhotoPath = "~/Content/images" + File.FileName;
            stu.CreatedDate = DateTime.Now;
            Context.Students.Add(stu);
            Context.SaveChanges();
            TempData["Feedback"] = stu.FirstName + " " + stu.LastName + " has been added successfully";
            return RedirectToAction("Index");
        }
        public ActionResult Edit(int Id)
        {
            ViewBag.Faculties = new SelectList(Context.Faculties.Where(r => r.IsDeleted != true).ToList(), "Id", "Name");
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