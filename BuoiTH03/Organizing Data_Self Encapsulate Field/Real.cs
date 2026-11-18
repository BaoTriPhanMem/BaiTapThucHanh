using System;

namespace OrganizingData_SelfEncapsulateField
{
    /// <summary>
    /// Real: Self Encapsulate Field
    /// Trước: truy cập trực tiếp field private bên trong class
    /// Sau  : dùng getter/setter ngay cả bên trong class
    /// </summary>
    public class Real
    {
        // ========== BEFORE ==========
        /*
        class PhieuBan
        {
            private decimal tongTien;
            private decimal daTra;

            decimal TinhConNo()
            {
                return tongTien - daTra;   // truy cập trực tiếp field
            }
        }
        */

        // ========== AFTER ==========
        class PhieuBan
        {
            private decimal tongTien;
            private decimal daTra;

            decimal TongTien
            {
                get { return tongTien; }
                set { tongTien = value; }
            }

            decimal DaTra
            {
                get { return daTra; }
                set { daTra = value; }
            }

            decimal TinhConNo()
            {
                return TongTien - DaTra;   // dùng property
            }
        }
    }
}
