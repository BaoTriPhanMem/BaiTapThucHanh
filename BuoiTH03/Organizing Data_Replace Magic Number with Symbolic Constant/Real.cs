using System;

namespace OrganizingData_ReplaceMagicNumberwithSymbolicConstant
{
    /// <summary>
    /// Real: Replace Magic Number with Symbolic Constant
    /// Trước: dùng số cứng (magic number) trong tính toán
    /// Sau  : thay bằng hằng số có tên rõ nghĩa
    /// </summary>
    public class Real
    {
        // ========== BEFORE ==========
        /*
        decimal TinhThanhTien(decimal donGia, int soLuong)
        {
            // giảm 5% nếu mua trên 50
            if (soLuong > 50)
                return donGia * soLuong * 0.95m;
            return donGia * soLuong;
        }
        */

        // ========== AFTER ==========
        const decimal TY_LE_GIAM_GIA = 0.95m;
        const int SO_LUONG_TOI_THIEU_DE_GIAM = 50;

        decimal TinhThanhTien(decimal donGia, int soLuong)
        {
            if (soLuong > SO_LUONG_TOI_THIEU_DE_GIAM)
                return donGia * soLuong * TY_LE_GIAM_GIA;
            return donGia * soLuong;
        }
    }
}
