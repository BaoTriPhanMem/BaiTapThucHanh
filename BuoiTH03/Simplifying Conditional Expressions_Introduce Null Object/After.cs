namespace SimplifyingConditionalExpressions_IntroduceNullObject
{
    public class After
    {
        public class Customer
        {
            public virtual bool IsNull { get { return false; } }
            public virtual Plan GetPlan() { return new Plan(); }
        }

        public sealed class NullCustomer : Customer
        {
            public override bool IsNull
            {
                get { return true; }
            }

            public override Plan GetPlan()
            {
                return new NullPlan();
            }
            // Some other NULL functionality.
        }

        public class Plan { }
        public class NullPlan : Plan { }

        void Example(Customer customer)
        {
            // Replace null values with Null-object.
            customer = customer ?? new NullCustomer();

            // Use Null-object as if it's normal subclass.
            Plan plan = customer.GetPlan();
        }
    }
}
