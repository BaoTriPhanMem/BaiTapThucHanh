using System;
using System.Windows.Forms;
using CuahangNongduoc.Controller;

namespace DealingwithGeneralization_PullUpConstructorBody
{
    /// <summary>
    /// Real example: Apply Pull Up Constructor Body
    /// to code inspired by Cuahang_Nongduoc (frmBanLe / frmBanSi share similar init)
    /// 
    /// BEFORE: các subclass form có constructor gần giống nhau (gán status, controller...)
    /// AFTER : đưa phần code chung lên constructor của lớp cha, subclass gọi base(...)
    /// </summary>
    public class Real
    {
        // ========== BEFORE ==========
        /*
        public class frmBanLe : Form
        {
            protected Controll status;
            protected PhieuBanController ctrlPhieuBan;

            public frmBanLe()
            {
                // code giống nhau
                status = Controll.AddNew;
                ctrlPhieuBan = new PhieuBanController();
            }

            public frmBanLe(PhieuBanController ctrlPB)
            {
                // code giống nhau + thêm
                status = Controll.Normal;
                ctrlPhieuBan = ctrlPB;
            }
        }

        public class frmBanSi : Form
        {
            protected Controll status;
            protected PhieuBanController ctrlPhieuBan;

            public frmBanSi()
            {
                // code giống nhau
                status = Controll.AddNew;
                ctrlPhieuBan = new PhieuBanController();
            }

            public frmBanSi(PhieuBanController ctrlPB)
            {
                // code giống nhau + thêm
                status = Controll.Normal;
                ctrlPhieuBan = ctrlPB;
            }
        }
        */

        // ========== AFTER (Pull Up Constructor Body) ==========
        public class PhieuBanFormBase : Form
        {
            protected Controll status;
            protected PhieuBanController ctrlPhieuBan;

            // Constructor chung được pull up
            public PhieuBanFormBase()
            {
                status = Controll.AddNew;
                ctrlPhieuBan = new PhieuBanController();
            }

            public PhieuBanFormBase(PhieuBanController ctrlPB) : this()
            {
                status = Controll.Normal;
                ctrlPhieuBan = ctrlPB;
            }
        }

        public class frmBanLe : PhieuBanFormBase
        {
            public frmBanLe() : base()
            {
                // chỉ còn phần riêng của BanLe (nếu có)
            }

            public frmBanLe(PhieuBanController ctrlPB) : base(ctrlPB)
            {
                // chỉ còn phần riêng của BanLe (nếu có)
            }
        }

        public class frmBanSi : PhieuBanFormBase
        {
            public frmBanSi() : base()
            {
                // chỉ còn phần riêng của BanSi (nếu có)
            }

            public frmBanSi(PhieuBanController ctrlPB) : base(ctrlPB)
            {
                // chỉ còn phần riêng của BanSi (nếu có)
            }
        }

        // Enum giả lập
        public enum Controll { Normal, AddNew, Edit }
    }
}
