using System;
using System.Windows.Forms;

namespace SimplifyingMethodCalls_ReplaceErrorCodewithException
{
    /// <summary>
    /// Real: Replace Error Code with Exception
    /// Trước: trả về mã lỗi (-1, 0...) khi số lượng không đủ
    /// Sau  : ném exception
    /// </summary>
    public class Real
    {
        private int soLuongTon = 50;

        // ========== BEFORE ==========
        /*
        int CapNhatSoLuong(int soLuongBan)
        {
            if (soLuongBan > soLuongTon)
            {
                return -1;   // mã lỗi
            }
            soLuongTon -= soLuongBan;
            return 0;        // thành công
        }
        */

        // ========== AFTER ==========
        /// <exception cref="SoLuongKhongDuException">Khi số lượng bán > tồn kho</exception>
        void CapNhatSoLuong(int soLuongBan)
        {
            if (soLuongBan > soLuongTon)
            {
                throw new SoLuongKhongDuException();
            }
            soLuongTon -= soLuongBan;
        }
    }

    public class SoLuongKhongDuException : Exception
    {
        public SoLuongKhongDuException()
            : base("Số lượng tồn kho không đủ!") { }
    }
}
