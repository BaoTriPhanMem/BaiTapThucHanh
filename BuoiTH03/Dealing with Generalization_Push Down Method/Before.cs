namespace DealingwithGeneralization_PushDownMethod
{
    public class Before
    {
        public class Employee
        {
            public virtual decimal GetSpecialBonus()
            {
                return 0;
            }
        }

        public class Manager : Employee
        {
            public override decimal GetSpecialBonus()
            {
                return 1000;
            }
        }

        public class Intern : Employee
        {
        }
    }
}

