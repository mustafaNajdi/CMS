using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CMS.Models;

namespace CMS.Controllers
{
    public class ManageRequestController : Controller
    {
        // GET: ManageRequest
        CMSdb db = new CMSdb();
        public ActionResult Index()
        {
            if(Session["UserId"]==null)
            {
                return RedirectToAction("Login", "Account");
            }        
            return View(db.Requests.OrderByDescending(o=>o.CreatedDate).ToList());
        }
        public ActionResult Logout()
        {
            Session["UserId"] = null;
            return RedirectToAction("Login", "Account");
        }
        public ActionResult StatisticCheck(int id,int opt)
        {
            if (Session["UserId"] == null)
            {
                return RedirectToAction("Login", "Account");
            }
            if (opt == 1)
            {
                Request req = db.Requests.Find(id);
                req.IsChecked = true;
                db.SaveChanges();
                TempData["S_msg"] = "Request approved and moved to Dean";
                return RedirectToAction("Index");
            }
            else
            {
                Request req = db.Requests.Find(id);
                req.IsChecked = false;
                db.SaveChanges();
                TempData["S_msg"] = "Request rejected and deleted";
                return RedirectToAction("Index");
            }
        }
        public ActionResult DeanCheck(int id, int opt)
        {
            if (Session["UserId"] == null)
            {
                return RedirectToAction("Login", "Account");
            }
            Request req = db.Requests.Find(id);
            if (opt == 1)
            {               
                req.IsApproved = true;
                db.SaveChanges();
                TempData["D_msg"] = "Request approved and moved to student affairs";
                return RedirectToAction("Index");
            }
            else
            {                
                req.IsApproved = false;
                db.SaveChanges();
                TempData["D_msg"] = "Request rejected and deleted";
                return RedirectToAction("Index");
            }
        }
        public ActionResult Deliver(int id)
        {        
            if (Session["UserId"] == null)
            {
                return RedirectToAction("Login", "Account");
            }
            Request req = db.Requests.Find(id);
            req.IsDeliverd = true;
            db.SaveChanges();
            TempData["Di_msg"] = "Certificate is delivered";
            return RedirectToAction("Index");
        }
    }
}