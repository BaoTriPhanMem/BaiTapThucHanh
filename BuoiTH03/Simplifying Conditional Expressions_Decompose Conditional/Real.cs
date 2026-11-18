using System;
using System.Windows.Forms;

namespace SimplifyingConditionalExpressions_DecomposeConditional
{
    /// <summary>
    /// Real: Decompose Conditional – lấy từ logic kiểm tra & tính tiền trong frmBanLe
    /// </summary>
    public class Real
    {
        private NumericUpDown numSoLuong = new NumericUpDown();
        private NumericUpDown numDonGia = new NumericUpDown();
        private ComboBox cmbMaSanPham = new ComboBox();

        // ========== BEFORE ==========
        /*
        void btnAdd_Click(...)
        {
            if (cmbMaSanPham.SelectedValue == null || numSoLuong.Value <= 0 || numDonGia.Value * numSoLuong.Value != numThanhTien.Value)
            {
                // nhiều điều kiện phức tạp + xử lý lỗi
                MessageBox.Show("Dữ liệu không hợp lệ");
            }
            else
            {
                // thêm chi tiết
            }
        }
        */

        // ========== AFTER ==========
        void btnAdd_Click(object sender, EventArgs e)
        {
            if (IsInvalidInput())
            {
                ShowError();
            }
            else
            {
                AddChiTiet();
            }
        }

        bool IsInvalidInput()
        {
            return cmbMaSanPham.SelectedValue == null
                || numSoLuong.Value <= 0
                || numDonGia.Value * numSoLuong.Value != GetThanhTien();
        }

        void ShowError()
        {
            MessageBox.Show("Dữ liệu không hợp lệ!", "Phiếu Bán", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }

        void AddChiTiet()
        {
            // logic thêm chi tiết phiếu bán
        }

        decimal GetThanhTien() => numDonGia.Value * numSoLuong.Value;
    }
}
