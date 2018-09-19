using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CMS.Models;

namespace CMS.Controllers
{
    
    public class AccountController : Controller
    {
        CMSdb Context = new CMSdb();
        // GET: Account
        public ActionResult Index()
        {
            List<User> User = new List<User>();
            User = Context.Users.ToList();
            return View(User);
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(User Us)
        {
            Context.Users.Add(Us);
            Context.SaveChanges();
            return RedirectToAction("Index");
            
        }
        public ActionResult Edit(int Id)
        {
            User Us = Context.Users.Find(Id);
            return View(Us);   
        }
        [HttpPost]
        public ActionResult Edit(User Us)
        {
            Context.Entry(Us).State = System.Data.Entity.EntityState.Modified;
            Context.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Delete(int Id)
        {
            User Us = Context.Users.Find(Id);
            Context.Users.Remove(Us);
            Context.SaveChanges();
            return RedirectToAction("Index");

        }
    }
}