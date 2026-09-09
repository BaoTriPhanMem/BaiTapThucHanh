using System;

namespace RefactoringGuru.DesignPatterns.AbstractFactory.SalesManagement
{
    // The Abstract Factory declares creation methods for a family of sales documents.
    public interface ISalesDocFactory
    {
        IInvoice CreateInvoice();
        IShippingSlip CreateShippingSlip();
    }

    // Concrete Factory 1: Offline Store Order
    class StoreSalesFactory : ISalesDocFactory
    {
        public IInvoice CreateInvoice()
        {
            return new ThermalReceiptInvoice();
        }

        public IShippingSlip CreateShippingSlip()
        {
            return new DirectTakeawaySlip();
        }
    }

    // Concrete Factory 2: Online Order
    class OnlineSalesFactory : ISalesDocFactory
    {
        public IInvoice CreateInvoice()
        {
            return new ElectronicInvoice();
        }

        public IShippingSlip CreateShippingSlip()
        {
            return new CourierShippingSlip();
        }
    }

    // Abstract Product A
    public interface IInvoice
    {
        string PrintInvoice();
    }

    class ThermalReceiptInvoice : IInvoice
    {
        public string PrintInvoice()
        {
            return "{Hóa đơn nhiệt: In trực tiếp tại quầy thanh toán}";
        }
    }

    class ElectronicInvoice : IInvoice
    {
        public string PrintInvoice()
        {
            return "{Hóa đơn điện tử VAT: Gửi kèm qua email khách hàng}";
        }
    }

    // Abstract Product B
    public interface IShippingSlip
    {
        string PrintSlip();
        string AttachToInvoice(IInvoice invoice);
    }

    class DirectTakeawaySlip : IShippingSlip
    {
        public string PrintSlip()
        {
            return "{Phiếu nhận hàng: Khách cầm tay nhận tại chỗ}";
        }

        public string AttachToInvoice(IInvoice invoice)
        {
            var result = invoice.PrintInvoice();
            return $"Phiếu tại quầy kết hợp cùng: ({result})";
        }
    }

    class CourierShippingSlip : IShippingSlip
    {
        public string PrintSlip()
        {
            return "{Vận đơn bưu cục: Gắn mã vạch theo dõi hành trình}";
        }

        public string AttachToInvoice(IInvoice invoice)
        {
            var result = invoice.PrintInvoice();
            return $"Mã vận đơn liên kết đồng bộ với: ({result})";
        }
    }

    class Client
    {
        public void Main()
        {
            Console.OutputEncoding = System.Text.Encoding.UTF8;
            Console.WriteLine("Client: Thử nghiệm xuất chứng từ cho đơn mua tại cửa hàng:");
            ClientCode(new StoreSalesFactory());

            Console.WriteLine("");

            Console.WriteLine("Client: Thử nghiệm xuất chứng từ cho đơn mua trực tuyến:");
            ClientCode(new OnlineSalesFactory());
        }

        public void ClientCode(ISalesDocFactory factory)
        {
            var invoice = factory.CreateInvoice();
            var slip = factory.CreateShippingSlip();

            Console.WriteLine(slip.PrintSlip());
            Console.WriteLine(slip.AttachToInvoice(invoice));
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