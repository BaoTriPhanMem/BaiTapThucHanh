using System;
using System.Windows.Forms;
using CuahangNongduoc.Controller;
using CuahangNongduoc.BusinessObject;

namespace ComposingMethods_InlineMethod
{
    /// <summary>
    /// Real example: Apply Inline Method to code from Cuahang_Nongduoc project
    /// (based on frmBanLe.cs - method Luu() và toolLuu_Click)
    /// 
    /// BEFORE: method Luu() chỉ chứa logic đơn giản, body rõ ràng hơn tên method
    /// AFTER : inline nội dung của Luu() vào nơi gọi, rồi xóa method Luu()
    /// </summary>
    public class Real
    {
        // Simulated fields from frmBanLe
        private Controll status = Controll.Normal;
        private PhieuBanController ctrlPhieuBan = new PhieuBanController();
        private ChiTietPhieuBanController ctrlChiTiet = new ChiTietPhieuBanController();
        private System.Collections.Generic.IList<MaSanPham> deleted = new System.Collections.Generic.List<MaSanPham>();

        // ========== BEFORE (có method riêng) ==========
        /*
        private void toolLuu_Click(object sender, EventArgs e)
        {
            // ...
            this.Luu();                     // gọi method
            status = Controll.Normal;
            this.Allow(false);
        }

        void Luu()                          // method chỉ chứa logic đơn giản
        {
            if (status == Controll.AddNew)
            {
                ThemMoi();
            }
            else
            {
                CapNhat();
            }
        }
        */

        // ========== AFTER (Inline Method applied) ==========
        private void toolLuu_Click(object sender, EventArgs e)
        {
            // Inline Method: thay lời gọi Luu() bằng chính nội dung của nó
            if (status == Controll.AddNew)
            {
                ThemMoi();
            }
            else
            {
                CapNhat();
            }

            status = Controll.Normal;
            this.Allow(false);
        }

        // Method Luu() đã bị xóa vì không còn cần thiết

        // Các method khác vẫn giữ nguyên (chỉ mô phỏng)
        void CapNhat()
        {
            foreach (MaSanPham masp in deleted)
            {
                CuahangNongduoc.DataLayer.MaSanPhanFactory.CapNhatSoLuong(masp.Id, masp.SoLuong);
            }
            deleted.Clear();
            ctrlChiTiet.Save();
            ctrlPhieuBan.Update();
        }

        void ThemMoi()
        {
            // ... logic thêm mới phiếu bán
        }

        void Allow(bool val) { }
    }

    // Enum giả lập
    public enum Controll { Normal, AddNew, Edit }
}
