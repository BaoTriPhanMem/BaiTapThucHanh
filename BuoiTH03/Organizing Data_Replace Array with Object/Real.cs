using System;

namespace OrganizingData_ReplaceArraywithObject
{
    /// <summary>
    /// Real: Replace Array with Object
    /// Trước: dùng mảng string[] để chứa thông tin sản phẩm
    /// Sau  : thay bằng class có field rõ nghĩa
    /// </summary>
    public class Real
    {
        // ========== BEFORE ==========
        /*
        void Example()
        {
            string[] sanPham = new string[3];
            sanPham[0] = "Phân NPK";      // tên
            sanPham[1] = "50000";         // giá
            sanPham[2] = "100";           // số lượng
        }
        */

        // ========== AFTER ==========
        class ThongTinSanPham
        {
            public string Ten { get; set; }
            public decimal Gia { get; set; }
            public int SoLuong { get; set; }
        }

        void Example()
        {
            ThongTinSanPham sanPham = new ThongTinSanPham();
            sanPham.Ten = "Phân NPK";
            sanPham.Gia = 50000;
            sanPham.SoLuong = 100;
        }
    }
}
