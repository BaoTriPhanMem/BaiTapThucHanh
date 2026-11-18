using System;
using System.Windows.Forms;
using CuahangNongduoc;

namespace ComposingMethods_InlineMethod
{
    /// <summary>
    /// Real example: Apply Inline Temp to code from Cuahang_Nongduoc project
    /// (based on frmBanLe.cs / frmNhapHang.cs - method ThemMoi)
    /// 
    /// BEFORE: dùng biến tạm "so" gán kết quả biểu thức đơn giản
    /// AFTER : thay thế biến tạm bằng chính biểu thức đó (Inline Temp)
    /// </summary>
    public class Real
    {
        private TextBox txtMaPhieu = new TextBox();

        // ========== BEFORE (có biến tạm) ==========
        /*
        void CapNhatMaPhieuBan()
        {
            if (ThamSo.LaSoNguyen(txtMaPhieu.Text))
            {
                long so = Convert.ToInt64(txtMaPhieu.Text);   // temporary variable
                if (so >= ThamSo.LayMaPhieuBan())
                {
                    ThamSo.GanMaPhieuBan(so + 1);
                }
            }
        }
        */

        // ========== AFTER (Inline Temp applied) ==========
        void CapNhatMaPhieuBan()
        {
            if (ThamSo.LaSoNguyen(txtMaPhieu.Text))
            {
                // Inline Temp: thay biến tạm "so" bằng biểu thức Convert.ToInt64(...)
                if (Convert.ToInt64(txtMaPhieu.Text) >= ThamSo.LayMaPhieuBan())
                {
                    ThamSo.GanMaPhieuBan(Convert.ToInt64(txtMaPhieu.Text) + 1);
                }
            }
        }
    }
}
