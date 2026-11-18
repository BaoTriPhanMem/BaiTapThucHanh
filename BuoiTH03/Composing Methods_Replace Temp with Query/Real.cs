using System;
using System.Windows.Forms;

namespace ComposingMethods_ReplaceTempwithQuery
{
    /// <summary>
    /// Real example: Apply Replace Temp with Query 
    /// to code from Cuahang_Nongduoc (frmBanLe.cs / frmBanSi.cs)
    /// 
    /// BEFORE: dùng biến tạm thanhTien = donGia * soLuong
    /// AFTER : tách thành method query ThanhTien() và gọi lại khi cần
    /// </summary>
    public class Real
    {
        // Simulated fields from frmBanLe
        private NumericUpDown numDonGia = new NumericUpDown();
        private NumericUpDown numSoLuong = new NumericUpDown();
        private NumericUpDown numThanhTien = new NumericUpDown();
        private NumericUpDown numTongTien = new NumericUpDown();

        // ========== BEFORE (dùng biến tạm) ==========
        /*
        private void numDonGia_ValueChanged(object sender, EventArgs e)
        {
            // Biến tạm lưu kết quả biểu thức
            decimal thanhTien = numDonGia.Value * numSoLuong.Value;
            numThanhTien.Value = thanhTien;
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            // ... validation ...
            decimal thanhTien = numDonGia.Value * numSoLuong.Value;  // lặp lại biểu thức
            if (thanhTien != numThanhTien.Value)
            {
                MessageBox.Show("Thành tiền sai!");
            }
            else
            {
                numTongTien.Value += thanhTien;
                // ...
            }
        }
        */

        // ========== AFTER (Replace Temp with Query) ==========
        private void numDonGia_ValueChanged(object sender, EventArgs e)
        {
            numThanhTien.Value = ThanhTien();   // gọi query method
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            // ... validation ...
            if (ThanhTien() != numThanhTien.Value)   // gọi lại query method
            {
                MessageBox.Show("Thành tiền sai!", "Phieu Nhap", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                numTongTien.Value += ThanhTien();
                // ... add row ...
            }
        }

        /// <summary>
        /// Query method – thay thế biến tạm thanhTien
        /// </summary>
        private decimal ThanhTien()
        {
            return numDonGia.Value * numSoLuong.Value;
        }
    }
}
