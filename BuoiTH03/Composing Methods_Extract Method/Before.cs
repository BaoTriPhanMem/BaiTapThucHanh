namespace ComposingMethods_ExtractMethod
{
    public class Before
    {
        private string name = "John";

        void PrintOwing()
        {
            this.PrintBanner();

            // Print details.
            Console.WriteLine("name: " + this.name);
            Console.WriteLine("amount: " + this.GetOutstanding());
        }

        private void PrintBanner()
        {
            Console.WriteLine("***"  );
        }

        private decimal GetOutstanding()
        {
            return 100;
        }
    }
}

