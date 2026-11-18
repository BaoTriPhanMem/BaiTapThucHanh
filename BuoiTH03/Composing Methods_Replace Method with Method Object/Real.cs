using System;
using System.Data;
using System.Windows.Forms;
using CuahangNongduoc.Controller;
using CuahangNongduoc.BusinessObject;

namespace ComposingMethods_ReplaceMethodwithMethodObject
{
    /// <summary>
    /// Real example: Apply Replace Method with Method Object
    /// to code from Cuahang_Nongduoc (frmBanLe.cs - method ThemMoi)
    /// 
    /// BEFORE: method ThemMoi() dài, nhiều biến cục bộ đan xen (khó Extract Method)
    /// AFTER : tách thành class ThemMoiPhieuBanCalculator (Method Object)
    ///         để có thể tách nhỏ logic bên trong dễ dàng hơn
    /// </summary>
    public class Real
    {
        // Simulated fields from frmBanLe
        private TextBox txtMaPhieu = new TextBox();
        private ComboBox cmbKhachHang = new ComboBox();
        private DateTimePicker dtNgayLapPhieu = new DateTimePicker();
        private NumericUpDown numTongTien = new NumericUpDown();
        private NumericUpDown numDaTra = new NumericUpDown();
        private NumericUpDown numConNo = new NumericUpDown();
        private PhieuBanController ctrlPhieuBan = new PhieuBanController();
        private ChiTietPhieuBanController ctrlChiTiet = new ChiTietPhieuBanController();

        // ========== BEFORE (method dài, nhiều biến cục bộ) ==========
        /*
        void ThemMoi()
        {
            DataRow row = ctrlPhieuBan.NewRow();
            row["ID"] = txtMaPhieu.Text;
            row["ID_KHACH_HANG"] = cmbKhachHang.SelectedValue;
            row["NGAY_BAN"] = dtNgayLapPhieu.Value.Date;
            row["TONG_TIEN"] = numTongTien.Value;
            row["DA_TRA"] = numDaTra.Value;
            row["CON_NO"] = numConNo.Value;
            ctrlPhieuBan.Add(row);

            PhieuBanController ctrl = new PhieuBanController();
            if (ctrl.LayPhieuBan(txtMaPhieu.Text) != null)
            {
                MessageBox.Show("Mã Phiếu bán này đã tồn tại !", "Phieu Nhap", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (ThamSo.LaSoNguyen(txtMaPhieu.Text))
            {
                long so = Convert.ToInt64(txtMaPhieu.Text);
                if (so >= ThamSo.LayMaPhieuBan())
                {
                    ThamSo.GanMaPhieuBan(so + 1);
                }
            }

            ctrlPhieuBan.Save();
            ctrlChiTiet.Save();
        }
        */

        // ========== AFTER (Replace Method with Method Object) ==========
        void ThemMoi()
        {
            // Chuyển method dài thành Method Object
            new ThemMoiPhieuBanCalculator(this).Compute();
        }

        /// <summary>
        /// Method Object – chứa toàn bộ logic của ThemMoi
        /// Các biến cục bộ trở thành field, dễ tách nhỏ method bên trong
        /// </summary>
        public class ThemMoiPhieuBanCalculator
        {
            private Real form;               // tham chiếu form gốc
            private DataRow row;
            private PhieuBanController ctrlCheck;
            private long soMaPhieu;

            public ThemMoiPhieuBanCalculator(Real form)
            {
                // Copy thông tin cần thiết từ form
                this.form = form;
            }

            public void Compute()
            {
                TaoDongMoi();
                KiemTraTonTai();
                CapNhatMaPhieu();
                LuuDuLieu();
            }

            private void TaoDongMoi()
            {
                row = form.ctrlPhieuBan.NewRow();
                row["ID"] = form.txtMaPhieu.Text;
                row["ID_KHACH_HANG"] = form.cmbKhachHang.SelectedValue;
                row["NGAY_BAN"] = form.dtNgayLapPhieu.Value.Date;
                row["TONG_TIEN"] = form.numTongTien.Value;
                row["DA_TRA"] = form.numDaTra.Value;
                row["CON_NO"] = form.numConNo.Value;
                form.ctrlPhieuBan.Add(row);
            }

            private void KiemTraTonTai()
            {
                ctrlCheck = new PhieuBanController();
                if (ctrlCheck.LayPhieuBan(form.txtMaPhieu.Text) != null)
                {
                    MessageBox.Show("Mã Phiếu bán này đã tồn tại !", "Phieu Nhap",
                        MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
            }

            private void CapNhatMaPhieu()
            {
                if (ThamSo.LaSoNguyen(form.txtMaPhieu.Text))
                {
                    soMaPhieu = Convert.ToInt64(form.txtMaPhieu.Text);
                    if (soMaPhieu >= ThamSo.LayMaPhieuBan())
                    {
                        ThamSo.GanMaPhieuBan(soMaPhieu + 1);
                    }
                }
            }

            private void LuuDuLieu()
            {
                form.ctrlPhieuBan.Save();
                form.ctrlChiTiet.Save();
            }
        }
    }
}
