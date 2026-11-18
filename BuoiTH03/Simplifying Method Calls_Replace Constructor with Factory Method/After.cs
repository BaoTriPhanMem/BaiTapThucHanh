namespace SimplifyingMethodCalls_ReplaceConstructorwithFactoryMethod
{
    public class After
    {
        public class Employee
        {
            private int type;

            private Employee(int type)
            {
                this.type = type;
            }

            public static Employee Create(int type)
            {
                Employee employee = new Employee(type);
                // Do some heavy lifting.
                return employee;
            }
            // ...
        }
    }
}
