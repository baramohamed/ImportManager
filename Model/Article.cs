//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Article
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Article()
        {
            this.ReferencesFournisseurs = new HashSet<ReferenceFournisseur>();
            this.ValeursAttributs = new HashSet<Valeur>();
        }
    
        public int Id { get; set; }
        public string Reference { get; set; }
        public string Designation { get; set; }
        public string OEM { get; set; }
        public Nullable<decimal> PoidsNet { get; set; }
        public Nullable<decimal> Volume { get; set; }
    
        public virtual Catalogue Catalogue { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ReferenceFournisseur> ReferencesFournisseurs { get; set; }
        public virtual Produit Produit { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Valeur> ValeursAttributs { get; set; }
        public virtual Packaging Packaging { get; set; }
    }
}
