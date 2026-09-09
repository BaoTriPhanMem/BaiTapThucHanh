using System;
using System.Collections.Generic;

namespace RefactoringGuru.DesignPatterns.Builder.SalesManagement
{
    // The Builder interface specifies methods for creating different parts of an Order.
    public interface IOrderBuilder
    {
        void Reset();
        void SetCustomerInfo(string customerName, string address);
        void AddMainItem(string itemName, double price);
        void AddGiftItem(string giftName);
        void ApplyDiscount(double discountAmount);
    }

    // Concrete Builder tracks the order being assembled.
    public class RetailOrderBuilder : IOrderBuilder
    {
        private OrderProduct _order = new OrderProduct();

        public RetailOrderBuilder()
        {
            this.Reset();
        }

        public void Reset()
        {
            this._order = new OrderProduct();
        }

        public void SetCustomerInfo(string customerName, string address)
        {
            this._order.Customer = $"{customerName} ({address})";
        }

        public void AddMainItem(string itemName, double price)
        {
            this._order.Items.Add($"{itemName} [{price:N0} VND]");
            this._order.Subtotal += price;
        }

        public void AddGiftItem(string giftName)
        {
            this._order.Gifts.Add(giftName);
        }

        public void ApplyDiscount(double discountAmount)
        {
            this._order.Discount = discountAmount;
        }

        public OrderProduct GetProduct()
        {
            OrderProduct result = this._order;
            this.Reset();
            return result;
        }
    }

    // The Product class representing the assembled order.
    public class OrderProduct
    {
        public string Customer { get; set; } = "Khách vãng lai";
        public List<string> Items { get; set; } = new List<string>();
        public List<string> Gifts { get; set; } = new List<string>();
        public double Subtotal { get; set; } = 0;
        public double Discount { get; set; } = 0;

        public string ListParts()
        {
            string str = $"Thông tin khách hàng: {Customer}\n";
            str += $"Chi tiết mặt hàng: {string.Join(", ", Items)}\n";
            if (Gifts.Count > 0)
            {
                str += $"Quà tặng đính kèm: {string.Join(", ", Gifts)}\n";
            }
            double finalTotal = Subtotal - Discount;
            str += $"Tạm tính: {Subtotal:N0} VND | Giảm giá: {Discount:N0} VND => Tổng tiền: {finalTotal:N0} VND\n";
            return str;
        }
    }

    // The Director is responsible for executing the building steps in a particular sequence.
    public class SalesDirector
    {
        private IOrderBuilder _builder;

        public IOrderBuilder Builder
        {
            set { _builder = value; }
        }

        public void BuildStandardOrder()
        {
            this._builder.SetCustomerInfo("Nguyen Van A", "Can Tho");
            this._builder.AddMainItem("Op lung Silicon", 80000);
        }

        public void BuildVipComboOrder()
        {
            this._builder.SetCustomerInfo("Vip Customer", "TP. Ho Chi Minh");
            this._builder.AddMainItem("Tai nghe Bluetooth", 450000);
            this._builder.AddMainItem("Kinh cuong luc 9D", 120000);
            this._builder.AddGiftItem("Day deo trang tri");
            this._builder.ApplyDiscount(50000);
        }
    }

    class Client
    {
        public void Main()
        {
            Console.OutputEncoding = System.Text.Encoding.UTF8;
            var director = new SalesDirector();
            var builder = new RetailOrderBuilder();
            director.Builder = builder;

            Console.WriteLine("Standard basic order:");
            director.BuildStandardOrder();
            Console.WriteLine(builder.GetProduct().ListParts());

            Console.WriteLine("Standard full featured order (VIP):");
            director.BuildVipComboOrder();
            Console.WriteLine(builder.GetProduct().ListParts());

            Console.WriteLine("Custom order (Without director):");
            builder.SetCustomerInfo("Khach le", "Long Xuyen");
            builder.AddMainItem("Cu sac nhanh 20W", 210000);
            builder.ApplyDiscount(10000);
            Console.WriteLine(builder.GetProduct().ListParts());
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