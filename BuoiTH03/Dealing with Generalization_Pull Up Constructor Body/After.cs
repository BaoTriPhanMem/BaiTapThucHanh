namespace DealingwithGeneralization_PullUpConstructorBody
{
    public class After
    {
        public class Employee
        {
            protected string name;
            protected string id;

            public Employee(string name, string id)
            {
                this.name = name;
                this.id = id;
            }
        }

        public class Manager : Employee
        {
            private int grade;

            public Manager(string name, string id, int grade) : base(name, id)
            {
                this.grade = grade;
            }
            // ...
        }
    }
}
