using System;
using System.Diagnostics;
using System.Windows.Forms;

namespace SimplifyingConditionalExpressions_IntroduceAssertion
{
    /// <summary>
    /// Real: Introduce Assertion
    /// Thêm assertion để đảm bảo điều kiện tiên quyết trước khi tính toán
    /// </summary>
    public class Real
    {
        private NumericUpDown numDonGia = new NumericUpDown();
        private NumericUpDown numSoLuong = new NumericUpDown();
        private ComboBox cmbMaSanPham = new ComboBox();

        // ========== BEFORE ==========
        /*
        decimal TinhThanhTien()
        {
            // Giả định: đã chọn mã SP và số lượng > 0
            return numDonGia.Value * numSoLuong.Value;
        }
        */

        // ========== AFTER ==========
        decimal TinhThanhTien()
        {
            // Assertion: đảm bảo điều kiện tiên quyết
            Debug.Assert(cmbMaSanPham.SelectedValue != null, "Phải chọn Mã sản phẩm trước");
            Debug.Assert(numSoLuong.Value > 0, "Số lượng phải lớn hơn 0");

            return numDonGia.Value * numSoLuong.Value;
        }
    }
}
