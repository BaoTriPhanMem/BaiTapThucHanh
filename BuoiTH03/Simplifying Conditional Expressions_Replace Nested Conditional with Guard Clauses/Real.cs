using System;
using System.Windows.Forms;

namespace SimplifyingConditionalExpressions_ReplaceNestedConditionalwithGuardClauses
{
    /// <summary>
    /// Real: Replace Nested Conditional with Guard Clauses
    /// Áp dụng cho validation trong btnAdd_Click của frmBanLe
    /// </summary>
    public class Real
    {
        private ComboBox cmbMaSanPham = new ComboBox();
        private NumericUpDown numSoLuong = new NumericUpDown();
        private NumericUpDown numDonGia = new NumericUpDown();
        private NumericUpDown numThanhTien = new NumericUpDown();

        // ========== BEFORE (nested) ==========
        /*
        void btnAdd_Click(...)
        {
            if (cmbMaSanPham.SelectedValue != null)
            {
                if (numSoLuong.Value > 0)
                {
                    if (numDonGia.Value * numSoLuong.Value == numThanhTien.Value)
                    {
                        // thêm chi tiết
                    }
                    else
                    {
                        MessageBox.Show("Thành tiền sai!");
                    }
                }
                else
                {
                    MessageBox.Show("Vui lòng nhập Số lượng!");
                }
            }
            else
            {
                MessageBox.Show("Vui lòng chọn Mã sản phẩm!");
            }
        }
        */

        // ========== AFTER (Guard Clauses) ==========
        void btnAdd_Click(object sender, EventArgs e)
        {
            if (cmbMaSanPham.SelectedValue == null)
            {
                MessageBox.Show("Vui lòng chọn Mã sản phẩm!", "Phiếu Bán", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (numSoLuong.Value <= 0)
            {
                MessageBox.Show("Vui lòng nhập Số lượng!", "Phiếu Bán", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (numDonGia.Value * numSoLuong.Value != numThanhTien.Value)
            {
                MessageBox.Show("Thành tiền sai!", "Phiếu Bán", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            // Main logic – flat, dễ đọc
            // thêm chi tiết phiếu bán
        }
    }
}
