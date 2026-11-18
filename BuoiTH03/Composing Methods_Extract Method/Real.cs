//Before
// ... validation ...
using System.Data;

else
{
    numTongTien.Value += numThanhTien.Value;
    DataRow row = ctrlChiTiet.NewRow();
    row["ID_MA_SAN_PHAM"] = cmbMaSanPham.SelectedValue;
    // ... gán các cột khác ...
    ctrlChiTiet.Add(row);
}
//After
else
{
    this.AddChiTietPhieuBan();   // gọi method mới
}

private void AddChiTietPhieuBan()
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