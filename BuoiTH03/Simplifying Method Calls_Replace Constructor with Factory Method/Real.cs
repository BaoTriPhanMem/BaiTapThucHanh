using System;
using CuahangNongduoc.BusinessObject;
using CuahangNongduoc.Controller;

namespace SimplifyingMethodCalls_ReplaceConstructorwithFactoryMethod
{
    /// <summary>
    /// Real: Replace Constructor with Factory Method
    /// Trước: new trực tiếp MaSanPham / PhieuBan
    /// Sau  : dùng Factory Method để tạo + khởi tạo phức tạp
    /// </summary>
    public class Real
    {
        // ========== BEFORE ==========
        /*
        public class MaSanPham
        {
            public MaSanPham(string id, int soLuong)
            {
                this.Id = id;
                this.SoLuong = soLuong;
            }
            public string Id { get; set; }
            public int SoLuong { get; set; }
        }

        // Cách dùng:
        // MaSanPham masp = new MaSanPham("MSP001", 10);
        */

        // ========== AFTER ==========
        public class MaSanPham
        {
            public string Id { get; private set; }
            public int SoLuong { get; private set; }

            private MaSanPham(string id, int soLuong)
            {
                this.Id = id;
                this.SoLuong = soLuong;
            }

            /// <summary>
            /// Factory Method – thay thế constructor
            /// </summary>
            public static MaSanPham Create(string id, int soLuong)
            {
                if (string.IsNullOrEmpty(id))
                    throw new ArgumentException("Mã sản phẩm không được rỗng");
                if (soLuong < 0)
                    throw new ArgumentException("Số lượng không hợp lệ");

                MaSanPham masp = new MaSanPham(id, soLuong);
                // Có thể thêm logic khởi tạo phức tạp ở đây
                return masp;
            }
        }
    }
}
