﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class CMSdb : DbContext
    {
        public CMSdb()
            : base("name=CMSdb")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Batch> Batches { get; set; }
        public virtual DbSet<CertificateType> CertificateTypes { get; set; }
        public virtual DbSet<DeliveryType> DeliveryTypes { get; set; }
        public virtual DbSet<Faculty> Faculties { get; set; }
        public virtual DbSet<Faculty_Batch> Faculty_Batch { get; set; }
        public virtual DbSet<Payment> Payments { get; set; }
        public virtual DbSet<Request_Certificate> Request_Certificate { get; set; }
        public virtual DbSet<Request> Requests { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<Student> Students { get; set; }
        public virtual DbSet<User> Users { get; set; }
    }
}
