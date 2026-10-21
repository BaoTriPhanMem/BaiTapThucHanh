using System;
using System.Collections.Generic;

namespace RefactoringGuru.DesignPatterns.Prototype.SalesManagement
{
    public class ProductBundlePrototype
    {
        public string BundleName;
        public double BasePrice;
        public BundleDetail Detail;

        public ProductBundlePrototype ShallowCopy()
        {
            return (ProductBundlePrototype)this.MemberwiseClone();
        }

        public ProductBundlePrototype DeepCopy()
        {
            ProductBundlePrototype clone = (ProductBundlePrototype)this.MemberwiseClone();
            clone.Detail = new BundleDetail(this.Detail.AccessoriesList, this.Detail.WarrantyMonths);
            clone.BundleName = string.Copy(this.BundleName);
            return clone;
        }
    }

    public class BundleDetail
    {
        public List<string> AccessoriesList;
        public int WarrantyMonths;

        public BundleDetail(List<string> accessories, int warranty)
        {
            this.AccessoriesList = new List<string>(accessories);
            this.WarrantyMonths = warranty;
        }
    }

    class Client
    {
        public void Main()
        {
            Console.OutputEncoding = System.Text.Encoding.UTF8;

            // Khởi tạo Combo phụ kiện chuẩn
            ProductBundlePrototype originalBundle = new ProductBundlePrototype();
            originalBundle.BundleName = "Combo Sinh Vien Chuẩn";
            originalBundle.BasePrice = 300000;
            originalBundle.Detail = new BundleDetail(new List<string> { "Cap sac", "Gia do dien thoai" }, 6);

            // Nhân bản bằng Deep Copy
            ProductBundlePrototype customizedBundle = originalBundle.DeepCopy();
            customizedBundle.BundleName = "Combo Sinh Vien VIP";
            customizedBundle.BasePrice = 380000;
            customizedBundle.Detail.AccessoriesList.Add("Kính cuong luc");
            customizedBundle.Detail.WarrantyMonths = 12;

            Console.WriteLine("Original values of bundle:");
            DisplayValues(originalBundle);

            Console.WriteLine("\nCloned and modified bundle values:");
            DisplayValues(customizedBundle);
        }

        public static void DisplayValues(ProductBundlePrototype p)
        {
            Console.WriteLine($"  Gói: {p.BundleName} | Giá: {p.BasePrice:N0} VND | Bảo hành: {p.Detail.WarrantyMonths} tháng");
            Console.WriteLine($"  Chi tiết: {string.Join(", ", p.Detail.AccessoriesList)}");
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            new Client().Main();
        }
    }
}