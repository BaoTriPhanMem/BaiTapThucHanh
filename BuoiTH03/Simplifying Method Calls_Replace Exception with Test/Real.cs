using System;
using System.Windows.Forms;
using CuahangNongduoc.Controller;

namespace SimplifyingMethodCalls_ReplaceExceptionwithTest
{
    /// <summary>
    /// Real: Replace Exception with Test
    /// Trước: dùng try-catch để bắt lỗi khi SelectedValue null
    /// Sau  : kiểm tra điều kiện trước (test) thay vì bắt exception
    /// </summary>
    public class Real
    {
        private ComboBox cmbMaSanPham = new ComboBox();

        // ========== BEFORE ==========
        /*
        string LayMaSanPham()
        {
            try
            {
                return cmbMaSanPham.SelectedValue.ToString();
            }
            catch (NullReferenceException)
            {
                return string.Empty;
            }
        }
        */

        // ========== AFTER ==========
        string LayMaSanPham()
        {
            // Test điều kiện thay vì bắt exception
            if (cmbMaSanPham.SelectedValue == null)
            {
                return string.Empty;
            }
            return cmbMaSanPham.SelectedValue.ToString();
        }
    }
}
