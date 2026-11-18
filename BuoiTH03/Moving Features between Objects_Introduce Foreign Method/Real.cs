using System;
using System.Windows.Forms;

namespace MovingFeaturesbetweenObjects_IntroduceForeignMethod
{
    /// <summary>
    /// Real: Introduce Foreign Method
    /// Trước: gọi trực tiếp method của class tiện ích (DateTime / string...) trong form
    /// Sau  : tạo Foreign Method trong client class để bọc logic đó
    /// </summary>
    public class Real
    {
        private DateTimePicker dtNgayLapPhieu = new DateTimePicker();
        private TextBox txtMaPhieu = new TextBox();

        // ========== BEFORE ==========
        /*
        void CapNhatNgayHetHan()
        {
            // Gọi trực tiếp method của DateTime (utility class)
            DateTime ngayHetHan = dtNgayLapPhieu.Value.AddDays(30);
            // ...
        }

        bool KiemTraMaPhieu()
        {
            // Gọi trực tiếp method của string
            return txtMaPhieu.Text.Trim().Length > 0;
        }
        */

        // ========== AFTER (Introduce Foreign Method) ==========
        void CapNhatNgayHetHan()
        {
            DateTime ngayHetHan = ThemNgay(dtNgayLapPhieu.Value, 30);
            // ...
        }

        bool KiemTraMaPhieu()
        {
            return CoGiaTri(txtMaPhieu.Text);
        }

        /// <summary>
        /// Foreign Method – bọc logic của DateTime.AddDays
        /// </summary>
        private static DateTime ThemNgay(DateTime date, int soNgay)
        {
            return date.AddDays(soNgay);
        }

        /// <summary>
        /// Foreign Method – bọc logic kiểm tra chuỗi rỗng
        /// </summary>
        private static bool CoGiaTri(string value)
        {
            return !string.IsNullOrWhiteSpace(value);
        }
    }
}
