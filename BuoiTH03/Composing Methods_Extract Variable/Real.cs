using System;
using System.Data;
using System.Windows.Forms;
using CuahangNongduoc.Controller;

namespace ComposingMethods_ExtractVariable
{
    /// <summary>
    /// Real example: Apply Extract Variable to code from Cuahang_Nongduoc project
    /// (based on frmBanLe.cs / frmBanSi.cs - method btnAdd_Click)
    /// 
    /// BEFORE: expression khó hiểu (tính thành tiền + so sánh nằm chung)
    /// AFTER : tách biểu thức ra biến có tên rõ nghĩa
    /// </summary>
    public class Real
    {
        // Simulated fields from frmBanLe / frmBanSi
        private ComboBox cmbMaSanPham = new ComboBox();
        private NumericUpDown numSoLuong = new NumericUpDown();
        private NumericUpDown numDonGia = new NumericUpDown();
        private NumericUpDown numThanhTien = new NumericUpDown();
        private NumericUpDown numTongTien = new NumericUpDown();
        private TextBox txtMaPhieu = new TextBox();
        private ChiTietPhieuBanController ctrlChiTiet = new ChiTietPhieuBanController();

        // ========== BEFORE (original style - expression hard to understand) ==========
        /*
        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (cmbMaSanPham.SelectedValue == null)
            {
                MessageBox.Show("Vui lòng chọn Mã sản phẩm !", "Phieu Nhap", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (numSoLuong.Value <= 0)
            {
                MessageBox.Show("Vui lòng nhập Số lượng !", "Phieu Nhap", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (numDonGia.Value * numSoLuong.Value != numThanhTien.Value)   // expression khó đọc
            {
                MessageBox.Show("Thành tiền sai!", "Phieu Nhap", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                numTongTien.Value += numThanhTien.Value;
                DataRow row = ctrlChiTiet.NewRow();
                row["ID_MA_SAN_PHAM"] = cmbMaSanPham.SelectedValue;
                row["ID_PHIEU_BAN"] = txtMaPhieu.Text;
                row["DON_GIA"] = numDonGia.Value;
                row["SO_LUONG"] = numSoLuong.Value;
                row["THANH_TIEN"] = numThanhTien.Value;
                ctrlChiTiet.Add(row);
            }
        }
        */

        // ========== AFTER (Extract Variable applied) ==========
        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (cmbMaSanPham.SelectedValue == null)
            {
                MessageBox.Show("Vui lòng chọn Mã sản phẩm !", "Phieu Nhap", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (numSoLuong.Value <= 0)
            {
                MessageBox.Show("Vui lòng nhập Số lượng !", "Phieu Nhap", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                // Extract Variable: tách biểu thức tính thành tiền ra biến rõ nghĩa
                decimal thanhTienTinhToan = numDonGia.Value * numSoLuong.Value;

                if (thanhTienTinhToan != numThanhTien.Value)
                {
                    MessageBox.Show("Thành tiền sai!", "Phieu Nhap", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                else
                {
                    numTongTien.Value += numThanhTien.Value;
                    DataRow row = ctrlChiTiet.NewRow();
                    row["ID_MA_SAN_PHAM"] = cmbMaSanPham.SelectedValue;
                    row["ID_PHIEU_BAN"] = txtMaPhieu.Text;
                    row["DON_GIA"] = numDonGia.Value;
                    row["SO_LUONG"] = numSoLuong.Value;
                    row["THANH_TIEN"] = numThanhTien.Value;
                    ctrlChiTiet.Add(row);
                }
            }
        }
    }
}
