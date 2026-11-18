using System;
using System.Windows.Forms;

namespace ComposingMethods_SplitTemporaryVariable
{
    /// <summary>
    /// Real example: Apply Split Temporary Variable
    /// to code from Cuahang_Nongduoc (frmBanLe.cs / frmBanSi.cs)
    /// 
    /// BEFORE: dùng 1 biến tạm "temp" / "giaTri" cho nhiều mục đích khác nhau
    /// AFTER : tách thành các biến riêng, mỗi biến chỉ mang 1 ý nghĩa
    /// </summary>
    public class Real
    {
        // Simulated fields from frmBanLe
        private NumericUpDown numDonGia = new NumericUpDown();
        private NumericUpDown numSoLuong = new NumericUpDown();
        private NumericUpDown numTongTien = new NumericUpDown();
        private NumericUpDown numDaTra = new NumericUpDown();
        private NumericUpDown numConNo = new NumericUpDown();

        // ========== BEFORE (1 biến tạm dùng cho nhiều việc) ==========
        /*
        private void TinhToan()
        {
            // Biến tạm bị tái sử dụng cho 2 mục đích khác nhau
            decimal temp = numDonGia.Value * numSoLuong.Value;   // thành tiền
            numTongTien.Value += temp;

            temp = numTongTien.Value - numDaTra.Value;           // còn nợ
            numConNo.Value = temp;
        }
        */

        // ========== AFTER (Split Temporary Variable) ==========
        private void TinhToan()
        {
            // Mỗi biến chỉ chịu trách nhiệm 1 việc
            decimal thanhTien = numDonGia.Value * numSoLuong.Value;
            numTongTien.Value += thanhTien;

            decimal conNo = numTongTien.Value - numDaTra.Value;
            numConNo.Value = conNo;
        }
    }
}
