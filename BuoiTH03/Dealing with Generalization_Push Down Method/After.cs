namespace DealingwithGeneralization_PushDownMethod
{
    public class After
    {
        public class Employee
        {
        }

        public class Manager : Employee
        {
            public decimal GetSpecialBonus()
            {
                return 1000;
            }
        }

        public class Intern : Employee
        {
        }
    }
}

