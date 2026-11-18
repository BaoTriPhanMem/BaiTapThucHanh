namespace DealingwithGeneralization_FormTemplateMethod
{
    public class Real
    {
        public abstract class DataProcessor
        {
            public void Process(string filePath)
            {
                string data = ReadFile(filePath);
                data = ValidateData(data);
                data = TransformData(data);
                SaveProcessedData(data);
                LogCompletion();
            }

            private string ReadFile(string filePath)
            {
                Console.WriteLine("Reading file: " + filePath);
                return "raw data";
            }

            protected abstract string ValidateData(string data);
            protected abstract string TransformData(string data);

            private void SaveProcessedData(string data)
            {
                Console.WriteLine("Saving processed data...");
            }

            private void LogCompletion()
            {
                Console.WriteLine("Process completed at: " + DateTime.Now);
            }
        }

        public class CsvProcessor : DataProcessor
        {
            protected override string ValidateData(string data)
            {
                Console.WriteLine("Validating CSV data...");
                return data;
            }

            protected override string TransformData(string data)
            {
                Console.WriteLine("Transforming to CSV format...");
                return data;
            }
        }

        public class JsonProcessor : DataProcessor
        {
            protected override string ValidateData(string data)
            {
                Console.WriteLine("Validating JSON data...");
                return data;
            }

            protected override string TransformData(string data)
            {
                Console.WriteLine("Transforming to JSON format...");
                return data;
            }
        }
    }
}

