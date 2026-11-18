using System;

namespace ComposingMethods_RemoveAssignmentstoParameters
{
    /// <summary>
    /// Real example: Apply Remove Assignments to Parameters 
    /// to code inspired by Cuahang_Nongduoc (tính đơn giá / thành tiền theo số lượng)
    /// 
    /// BEFORE: gán lại giá trị cho parameter inputVal bên trong method
    /// AFTER : dùng biến local (result) thay vì gán vào parameter
    /// </summary>
    public class Real
    {
        // ========== BEFORE (gán vào parameter) ==========
        /*
        // Ví dụ: tính đơn giá sau khi giảm theo số lượng mua (giống logic Discount trong mẫu)
        int TinhDonGiaSauGiam(int donGia, int soLuong)
        {
            if (soLuong > 50)          // mua nhiều thì giảm 2000đ
            {
                donGia -= 2000;        // gán lại parameter → xấu
            }
            // ... có thể còn logic khác
            return donGia;
        }
        */

        // ========== AFTER (Remove Assignments to Parameters) ==========
        int TinhDonGiaSauGiam(int donGia, int soLuong)
        {
            int result = donGia;       // dùng biến local thay vì gán vào parameter

            if (soLuong > 50)          // mua nhiều thì giảm 2000đ
            {
                result -= 2000;
            }
            // ... có thể còn logic khác
            return result;
        }
    }
}
