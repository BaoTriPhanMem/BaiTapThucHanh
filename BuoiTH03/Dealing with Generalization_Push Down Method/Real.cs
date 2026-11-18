namespace DealingwithGeneralization_PushDownMethod
{
    public class Real
    {
        public abstract class Vehicle
        {
            public abstract decimal GetPrice();
        }

        public class Car : Vehicle
        {
            public override decimal GetPrice() => 25000;

            public decimal GetInsuranceCost()
            {
                return GetPrice() * 0.05m;
            }
        }

        public class Bicycle : Vehicle
        {
            public override decimal GetPrice() => 500;
        }
    }
}

