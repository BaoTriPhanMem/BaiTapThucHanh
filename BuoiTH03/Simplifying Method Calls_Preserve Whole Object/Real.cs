using System;
using CuahangNongduoc.BusinessObject;
using CuahangNongduoc.Controller;

namespace SimplifyingMethodCalls_PreserveWholeObject
{
    /// <summary>
    /// Real: Preserve Whole Object
    /// Trước: lấy từng thuộc tính của MaSanPham rồi truyền riêng lẻ
    /// Sau  : truyền cả object MaSanPham
    /// </summary>
    public class Real
    {
        // ========== BEFORE ==========
        /*
        void HienThiGia(MaSanPham masp)
        {
            decimal giaNhap = masp.GiaNhap;
            decimal giaBanLe = masp.SanPham.GiaBanLe;
            decimal giaBanSi = masp.SanPham.GiaBanSi;

            CapNhatGia(giaNhap, giaBanLe, giaBanSi);
        }

        void CapNhatGia(decimal giaNhap, decimal giaBanLe, decimal giaBanSi)
        {
            // dùng 3 tham số riêng lẻ
        }
        */

        // ========== AFTER ==========
        void HienThiGia(MaSanPham masp)
        {
            CapNhatGia(masp);   // truyền cả object
        }

        void CapNhatGia(MaSanPham masp)
        {
            // dùng trực tiếp masp.GiaNhap, masp.SanPham.GiaBanLe...
            decimal giaNhap = masp.GiaNhap;
            decimal giaBanLe = masp.SanPham.GiaBanLe;
            decimal giaBanSi = masp.SanPham.GiaBanSi;
        }
    }
}
