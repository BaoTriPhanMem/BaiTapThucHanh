using System;
using System.Windows.Forms;
using CuahangNongduoc.Controller;

namespace SimplifyingConditionalExpressions_ConsolidateDuplicateConditionalFragments
{
    /// <summary>
    /// Real: Consolidate Duplicate Conditional Fragments
    /// Trước: Save() được gọi ở cả 2 nhánh if/else
    /// Sau  : đưa Save() ra ngoài conditional
    /// </summary>
    public class Real
    {
        private Controll status = Controll.AddNew;
        private PhieuBanController ctrlPhieuBan = new PhieuBanController();
        private ChiTietPhieuBanController ctrlChiTiet = new ChiTietPhieuBanController();

        // ========== BEFORE ==========
        /*
        void Luu()
        {
            if (status == Controll.AddNew)
            {
                ThemMoi();
                ctrlPhieuBan.Save();
                ctrlChiTiet.Save();
            }
            else
            {
                CapNhat();
                ctrlPhieuBan.Save();
                ctrlChiTiet.Save();
            }
        }
        */

        // ========== AFTER ==========
        void Luu()
        {
            if (status == Controll.AddNew)
            {
                ThemMoi();
            }
            else
            {
                CapNhat();
            }
            // Đoạn trùng lặp được đưa ra ngoài
            ctrlPhieuBan.Save();
            ctrlChiTiet.Save();
        }

        void ThemMoi() { }
        void CapNhat() { }

        public enum Controll { Normal, AddNew, Edit }
    }
}
