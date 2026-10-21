using System;

namespace RefactoringGuru.DesignPatterns.Singleton.SalesManagement
{
    // The Singleton class defines the `GetInstance` method that serves as an
    // alternative to constructor and lets clients access the same instance of this class over and over.
    class POSSessionManager
    {
        // Constructor is private to prevent direct construction with `new`.
        private POSSessionManager() { }

        // The Singleton's instance is stored in a static field.
        private static POSSessionManager _instance;

        // Business properties of the POS session
        public string ActiveCashier { get; set; }
        public int SessionId { get; set; }

        public static POSSessionManager GetInstance()
        {
            if (_instance == null)
            {
                _instance = new POSSessionManager();
            }
            return _instance;
        }

        public string LogTransaction(string receiptCode, double total)
        {
            return $"[Ca làm việc #{SessionId} - Thu ngân: {ActiveCashier}] Đã xuất đơn {receiptCode} tổng tiền {total:N0} VND.";
        }
    }

    class Client
    {
        public void Main()
        {
            Console.OutputEncoding = System.Text.Encoding.UTF8;

            // Client code accesses the singleton instance.
            POSSessionManager s1 = POSSessionManager.GetInstance();
            s1.SessionId = 101;
            s1.ActiveCashier = "Nguyen Van Thu Ngan";

            POSSessionManager s2 = POSSessionManager.GetInstance();

            if (s1 == s2)
            {
                Console.WriteLine("Singleton hoạt động chính xác, cả s1 và s2 đều trỏ về một phiên POS duy nhất.");
            }
            else
            {
                Console.WriteLine("Singleton thất bại, hai biến trỏ đến các phiên khác nhau.");
            }

            Console.WriteLine(s2.LogTransaction("HD_0001", 185000));
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