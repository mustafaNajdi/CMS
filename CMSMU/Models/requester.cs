
namespace CMSMU.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class requester
    {
        public int RequesterId { get; set; }
        public string RequesterName { get; set; }
        public string RequesterAddress { get; set; }
        public string RequesterPhone { get; set; }
        public Nullable<short> ActivationCode { get; set; }

    }
}
