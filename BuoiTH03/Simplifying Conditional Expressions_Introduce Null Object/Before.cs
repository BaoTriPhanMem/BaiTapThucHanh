namespace SimplifyingConditionalExpressions_IntroduceNullObject
{
    public class Before
    {
        public class Customer
        {
            public virtual Plan GetPlan() { return new Plan(); }
        }

        public class Plan { }
        public class BillingPlan
        {
            public static Plan Basic() { return new Plan(); }
        }

        void Example(Customer customer)
        {
            Plan plan;
            if (customer == null)
            {
                plan = BillingPlan.Basic();
            }
            else
            {
                plan = customer.GetPlan();
            }
        }
    }
}
