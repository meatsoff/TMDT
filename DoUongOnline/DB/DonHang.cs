//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DoUongOnline.DB
{
    using System;
    using System.Collections.Generic;
    
    public partial class DonHang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DonHang()
        {
            this.ChiTietDonHangs = new HashSet<ChiTietDonHang>();
            this.HoaDons = new HashSet<HoaDon>();
        }
    
        public int IdDH { get; set; }
        public System.DateTime NgayTaoDon { get; set; }
        public string DiaChiGiaoHang { get; set; }
        public string GhiChu { get; set; }
        public double TongTien { get; set; }
        public int DiemKHSuDung { get; set; }
        public int IdKH { get; set; }
        public string IdTinhTrangDH { get; set; }
        public Nullable<System.DateTime> NgayGioCapNhat { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietDonHang> ChiTietDonHangs { get; set; }
        public virtual KhachHang KhachHang { get; set; }
        public virtual TinhTrangDonHang TinhTrangDonHang { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HoaDon> HoaDons { get; set; }
    }
}