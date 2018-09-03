using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CMSMU.Models;

namespace CMSMU.Controllers
{
    public class RequesterController : Controller
    {
        CMSdb context = new CMSdb();
        // GET: Requester
        public ActionResult Requester()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(requester req)
        {
            context.requesters.Add(req);
            context.SaveChanges();
            return RedirectToAction("Index");
        }

    }
}