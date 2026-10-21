using System;

namespace RefactoringGuru.DesignPatterns.FactoryMethod.SalesManagement
{
    // The Creator class declares the factory method and core sales transaction logic.
    abstract class PaymentCreator
    {
        public abstract IPaymentProduct FactoryMethod();

        public string ProcessSaleTransaction(double amount)
        {
            // Call the factory method to create a concrete payment product.
            var payment = FactoryMethod();

            // Execute business logic with the created product.
            var result = "Hệ thống Bán hàng: Bắt đầu giao dịch trị giá " + amount.ToString("N0") + " VND.\n"
                + "-> " + payment.Pay(amount);

            return result;
        }
    }

    // Concrete Creators override the factory method to return specific payment types.
    class CashPaymentCreator : PaymentCreator
    {
        public override IPaymentProduct FactoryMethod()
        {
            return new CashPaymentProduct();
        }
    }

    class MomoPaymentCreator : PaymentCreator
    {
        public override IPaymentProduct FactoryMethod()
        {
            return new MomoPaymentProduct();
        }
    }

    // The Product interface declares common operations for all concrete payment products.
    public interface IPaymentProduct
    {
        string Pay(double amount);
    }

    // Concrete Products implement specific payment gateways.
    class CashPaymentProduct : IPaymentProduct
    {
        public string Pay(double amount)
        {
            return $"[Tiền mặt] Thu ngân đã nhận {amount:N0} VND tiền mặt tại quầy và xuất biên lai.";
        }
    }

    class MomoPaymentProduct : IPaymentProduct
    {
        public string Pay(double amount)
        {
            return $"[MoMo QR] Tạo mã thanh toán động MoMo thành công cho số tiền {amount:N0} VND.";
        }
    }

    class Client
    {
        public void Main()
        {
            Console.OutputEncoding = System.Text.Encoding.UTF8;
            Console.WriteLine("App: Khởi tạo thanh toán với quầy thu ngân (Cash).");
            ClientCode(new CashPaymentCreator(), 250000);

            Console.WriteLine("");

            Console.WriteLine("App: Khởi tạo thanh toán trực tuyến qua cổng MoMo.");
            ClientCode(new MomoPaymentCreator(), 500000);
        }

        public void ClientCode(PaymentCreator creator, double amount)
        {
            Console.WriteLine("Client: Không phụ thuộc vào lớp cụ thể, giao dịch vẫn chạy chuẩn xác:\n"
                + creator.ProcessSaleTransaction(amount));
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