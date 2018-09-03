using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CMSMU.Models;

namespace CMSMU.Controllers
{
    public class RequestController : Controller
    {
        CMSdb context = new CMSdb();
    
        // GET: Request
        public ActionResult Index()
        {
            List<requester> requester = new List<requester>();
            requester r = new requester();
            context.Registrars.ToList();
            r = context.requesters.Where(t => t.RequesterId == 1).First();

            return View();
        }
    }
}