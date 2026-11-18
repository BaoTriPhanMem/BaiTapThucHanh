using System;
using System.Windows.Forms;

namespace SimplifyingMethodCalls_ReplaceParameterwithMethodCall
{
    /// <summary>
    /// Real: Replace Parameter with Method Call
    /// Trước: tính sẵn giá trị rồi truyền vào method
    /// Sau  : method tự gọi query để lấy giá trị cần thiết
    /// </summary>
    public class Real
    {
        private NumericUpDown numDonGia = new NumericUpDown();
        private NumericUpDown numSoLuong = new NumericUpDown();
        private NumericUpDown numDaTra = new NumericUpDown();

        decimal GetThanhTien() => numDonGia.Value * numSoLuong.Value;
        decimal GetDaTra() => numDaTra.Value;

        // ========== BEFORE ==========
        /*
        decimal TinhConNo(decimal thanhTien, decimal daTra)
        {
            return thanhTien - daTra;
        }

        void Example()
        {
            decimal thanhTien = GetThanhTien();
            decimal daTra = GetDaTra();
            decimal conNo = TinhConNo(thanhTien, daTra);
        }
        */

        // ========== AFTER ==========
        decimal TinhConNo()
        {
            // method tự lấy dữ liệu cần thiết
            return GetThanhTien() - GetDaTra();
        }

        void Example()
        {
            decimal conNo = TinhConNo();
        }
    }
}
