//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CMS.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Request_Certificate
    {
        public int Id { get; set; }
        public Nullable<int> ReqId { get; set; }
        public Nullable<int> CertificateId { get; set; }
        public Nullable<int> Quantity { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
    
        public virtual CertificateType CertificateType { get; set; }
        public virtual Request Request { get; set; }
    }
}
