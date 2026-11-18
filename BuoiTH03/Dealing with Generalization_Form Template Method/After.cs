namespace DealingwithGeneralization_FormTemplateMethod
{
    public class After
    {
        public abstract class Report
        {
            public void Generate()
            {
                OpenConnection();
                GatherData();
                FormatReport();
                SaveReport();
                CloseConnection();
            }

            protected void OpenConnection() { Console.WriteLine("Opening connection..."); }
            protected void CloseConnection() { Console.WriteLine("Closing connection..."); }

            protected abstract void GatherData();
            protected abstract void FormatReport();
            protected abstract void SaveReport();
        }

        public class ReportA : Report
        {
            protected override void GatherData() { Console.WriteLine("Gathering data for Report A..."); }
            protected override void FormatReport() { Console.WriteLine("Formatting Report A..."); }
            protected override void SaveReport() { Console.WriteLine("Saving Report A..."); }
        }

        public class ReportB : Report
        {
            protected override void GatherData() { Console.WriteLine("Gathering data for Report B..."); }
            protected override void FormatReport() { Console.WriteLine("Formatting Report B..."); }
            protected override void SaveReport() { Console.WriteLine("Saving Report B..."); }
        }
    }
}

