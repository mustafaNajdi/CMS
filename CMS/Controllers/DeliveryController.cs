using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CMS.Models;

namespace CMS.Controllers
{
    public class DeliveryController : Controller
    {
        CMSdb Context = new CMSdb();
        // GET: Delivery
        public ActionResult Index()
        {
            List<DeliveryType> Del = new List<DeliveryType>();

            Del = Context.DeliveryTypes.ToList();
            return View(Del);
        }
        public ActionResult Create()
        {
        
            return View();
        }
        [HttpPost]
        public ActionResult Create(DeliveryType Del)
        {
            Context.DeliveryTypes.Add(Del);
            Context.SaveChanges();
            return RedirectToAction("index");
        }
        public ActionResult Update()
        {
            return View();
        }
    }
}