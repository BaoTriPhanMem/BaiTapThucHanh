namespace DealingwithGeneralization_FormTemplateMethod
{
    public class Before
    {
        public class ReportA
        {
            public void Generate()
            {
                Console.WriteLine("Opening connection...");
                Console.WriteLine("Gathering data for Report A...");
                Console.WriteLine("Formatting Report A...");
                Console.WriteLine("Saving Report A...");
                Console.WriteLine("Closing connection...");
            }
        }

        public class ReportB
        {
            public void Generate()
            {
                Console.WriteLine("Opening connection...");
                Console.WriteLine("Gathering data for Report B...");
                Console.WriteLine("Formatting Report B...");
                Console.WriteLine("Saving Report B...");
                Console.WriteLine("Closing connection...");
            }
        }
    }
}

