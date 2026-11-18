using System;
using CuahangNongduoc.BusinessObject;

namespace SimplifyingConditionalExpressions_IntroduceNullObject
{
    /// <summary>
    /// Real: Introduce Null Object
    /// Trước: kiểm tra null khi lấy MaSanPham / KhachHang
    /// Sau  : dùng NullMaSanPham thay cho null
    /// </summary>
    public class Real
    {
        // ========== BEFORE ==========
        /*
        void HienThiGia(MaSanPham masp)
        {
            if (masp == null)
            {
                // giá mặc định
                numDonGia.Value = 0;
            }
            else
            {
                numDonGia.Value = masp.SanPham.GiaBanLe;
            }
        }
        */

        // ========== AFTER ==========
        public class NullMaSanPham : MaSanPham
        {
            public NullMaSanPham() : base("", 0) { }

            // Override các thuộc tính trả về giá trị mặc định an toàn
            public new decimal GiaNhap { get { return 0; } }
        }

        void HienThiGia(MaSanPham masp)
        {
            // Thay null bằng Null Object
            masp = masp ?? new NullMaSanPham();

            // Dùng như object bình thường, không cần if null
            // numDonGia.Value = masp.SanPham.GiaBanLe;
        }
    }
}
