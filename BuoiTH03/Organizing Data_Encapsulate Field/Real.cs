using System;

namespace OrganizingData_EncapsulateField
{
    /// <summary>
    /// Real: Encapsulate Field
    /// Trước: field public
    /// Sau  : field private + property public
    /// </summary>
    public class Real
    {
        // ========== BEFORE ==========
        /*
        class KhachHang
        {
            public string ten;
            public string diaChi;
            public string dienThoai;
        }
        */

        // ========== AFTER ==========
        class KhachHang
        {
            private string ten;
            private string diaChi;
            private string dienThoai;

            public string Ten
            {
                get { return ten; }
                set { ten = value; }
            }

            public string DiaChi
            {
                get { return diaChi; }
                set { diaChi = value; }
            }

            public string DienThoai
            {
                get { return dienThoai; }
                set { dienThoai = value; }
            }
        }
    }
}
