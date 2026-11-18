namespace DealingwithGeneralization_PullUpMethod
{
    public class After
    {
        public abstract class Employee
        {
            public abstract decimal GetBonus();
        }

        public class Manager : Employee
        {
            public override decimal GetBonus()
            {
                return 5000;
            }
        }

        public class Developer : Employee
        {
            public override decimal GetBonus()
            {
                return 3000;
            }
        }
    }
}

