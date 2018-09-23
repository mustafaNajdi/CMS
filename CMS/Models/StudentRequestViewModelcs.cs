using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CMS.Models
{
    public class StudentRequestViewModelcs
    {
        public StudentRequestViewModelcs()
        {

        }
        public Request request { get; set; }
        public Request_Certificate Request_Certificate { get; set; }
        public Student Student { get; set; }
    }
}