namespace DealingwithGeneralization_ExtractSuperclass
{
    public class Real
    {
        public abstract class DatabaseConnection
        {
            protected string ConnectionString { get; set; }

            public virtual void Connect()
            {
                Console.WriteLine("Connecting...");
            }

            public virtual void Disconnect()
            {
                Console.WriteLine("Disconnecting...");
            }

            public abstract void ExecuteQuery(string query);
        }

        public class SqlServerConnection : DatabaseConnection
        {
            public override void ExecuteQuery(string query)
            {
                Console.WriteLine("Executing SQL Server query: " + query);
            }
        }

        public class MySqlConnection : DatabaseConnection
        {
            public override void ExecuteQuery(string query)
            {
                Console.WriteLine("Executing MySQL query: " + query);
            }
        }
    }
}

