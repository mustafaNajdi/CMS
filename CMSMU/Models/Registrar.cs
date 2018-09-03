
namespace CMSMU.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Registrar
    {
        public string RegName { get; set; }
        public string Password { get; set; }
        public string RegID { get; set; }
    }
}
