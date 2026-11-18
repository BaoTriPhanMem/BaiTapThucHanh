using System;
using System.Windows.Forms;

namespace SimplifyingConditionalExpressions_ConsolidateConditionalExpression
{
    /// <summary>
    /// Real: Consolidate Conditional Expression – gộp các điều kiện return sớm trong validation
    /// </summary>
    public class Real
    {
        private ComboBox cmbMaSanPham = new ComboBox();
        private NumericUpDown numSoLuong = new NumericUpDown();
        private NumericUpDown numDonGia = new NumericUpDown();
        private NumericUpDown numThanhTien = new NumericUpDown();

        // ========== BEFORE ==========
        /*
        bool IsInvalid()
        {
            if (cmbMaSanPham.SelectedValue == null) return true;
            if (numSoLuong.Value <= 0) return true;
            if (numDonGia.Value * numSoLuong.Value != numThanhTien.Value) return true;
            return false;
        }
        */

        // ========== AFTER ==========
        bool IsInvalid()
        {
            return cmbMaSanPham.SelectedValue == null
                || numSoLuong.Value <= 0
                || numDonGia.Value * numSoLuong.Value != numThanhTien.Value;
        }
    }
}
