//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MVCAssignment2.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Screen
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Screen()
        {
            this.moviebookings = new HashSet<moviebooking>();
        }
    
        public int sid { get; set; }
        public Nullable<int> tid { get; set; }
        public Nullable<int> Mid { get; set; }
        public Nullable<int> NoOfSeats { get; set; }
        public Nullable<int> Amount { get; set; }
    
        public virtual Movie Movie { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<moviebooking> moviebookings { get; set; }
        public virtual theater theater { get; set; }
    }
}