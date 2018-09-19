using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CMS.Controllers
{
    public class FacultyController : Controller
    {
        // GET: Faculty
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult BatcIndex()
        {
            return View();
        }
        public ActionResult CreateFaculty()
        {
            return View();
        }
        public ActionResult CreateBatch()
        {
            return View();
        }
        public ActionResult EditFaculty()
        {
            return View();
        }
    }
}