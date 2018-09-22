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
            User = Context.Users.Where(u=>u.IsDeleted!=true).ToList();
            return View(User);
        }
        public ActionResult Create()
        {
            ViewBag.Roles = new SelectList(Context.Roles.Where(r => r.IsDeleted != true).ToList(), "Id", "RoleName");
            return View();
        }
        [HttpPost]
        public ActionResult Create(User Us)
        {
            Us.CreatedDate = DateTime.Now;
            Us.UpdatedDate = DateTime.Now;
            Context.Users.Add(Us);
            Context.SaveChanges();
            TempData["Feedback"] = Us.FirstName + " " + Us.LastName + " has been added successfully";
            return RedirectToAction("Index");
            
        }
        public ActionResult Edit(int id)
        {
            User Us = Context.Users.Find(id);
            string selected = Us.Role.RoleName;
            ViewBag.Roles = new SelectList(Context.Roles.Where(r => r.IsDeleted != true).ToList(), "Id", "RoleName",selected);          
            return View(Us);   
        }
        [HttpPost]
        public ActionResult Edit(User Us)
        {
            Context.Entry(Us).State = System.Data.Entity.EntityState.Modified;
            Context.SaveChanges();
            TempData["Feedback"] = Us.FirstName + " " + Us.LastName + " has been modified successfully";
            return RedirectToAction("Index");
        }
        public ActionResult Delete(int id)
        {        
            User Us = Context.Users.Find(id);
            Us.IsDeleted = true;
            Context.Entry(Us).State = System.Data.Entity.EntityState.Modified;
            Context.SaveChanges();
            TempData["Feedback"] = Us.FirstName + " " + Us.LastName + " has been deleted successfully";
            return RedirectToAction("Index");

        }
    }
}