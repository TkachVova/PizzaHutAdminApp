//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PizzaHutAdminApp.DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class customer
    {
        public customer()
        {
            this.orders = new HashSet<order>();
        }
    
        public int id { get; set; }
        public string name { get; set; }
        public string phone { get; set; }
    
        public virtual ICollection<order> orders { get; set; }
    }
}
