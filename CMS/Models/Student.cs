
namespace CMS.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Student
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Student()
        {
            this.Requests = new HashSet<Request>();
            this.StudentTemporaryUrls = new HashSet<StudentTemporaryUrl>();
        }
    
        public int Id { get; set; }
        public Nullable<long> StudentIndex { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public Nullable<int> FacultyId { get; set; }
        public string PhotoPath { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
    
        public virtual Faculty Faculty { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Request> Requests { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StudentTemporaryUrl> StudentTemporaryUrls { get; set; }
    }
}
