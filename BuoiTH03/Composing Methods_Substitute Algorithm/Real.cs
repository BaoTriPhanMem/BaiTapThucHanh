using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace ComposingMethods_SubstituteAlgorithm
{
    /// <summary>
    /// Real example: Apply Substitute Algorithm
    /// to code from Cuahang_Nongduoc (kiểm tra trạng thái / tìm loại phiếu)
    /// 
    /// BEFORE: nhiều câu if so sánh từng giá trị
    /// AFTER : dùng List + Contains (thuật toán rõ ràng, dễ mở rộng hơn)
    /// </summary>
    public class Real
    {
        // ========== BEFORE (nhiều if riêng lẻ) ==========
        /*
        string LayTenLoaiPhieu(string maLoai)
        {
            if (maLoai.Equals("BL"))
            {
                return "Phiếu Bán Lẻ";
            }
            if (maLoai.Equals("BS"))
            {
                return "Phiếu Bán Sỉ";
            }
            if (maLoai.Equals("NH"))
            {
                return "Phiếu Nhập Hàng";
            }
            if (maLoai.Equals("PC"))
            {
                return "Phiếu Chi";
            }
            return string.Empty;
        }
        */

        // ========== AFTER (Substitute Algorithm) ==========
        string LayTenLoaiPhieu(string maLoai)
        {
            // Thuật toán mới: dùng dictionary / list rõ ràng hơn
            Dictionary<string, string> danhSachLoai = new Dictionary<string, string>()
            {
                { "BL", "Phiếu Bán Lẻ" },
                { "BS", "Phiếu Bán Sỉ" },
                { "NH", "Phiếu Nhập Hàng" },
                { "PC", "Phiếu Chi" }
            };

            if (danhSachLoai.ContainsKey(maLoai))
            {
                return danhSachLoai[maLoai];
            }

            return string.Empty;
        }
    }
}
