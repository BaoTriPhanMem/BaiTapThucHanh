namespace DealingwithGeneralization_PullUpConstructorBody
{
    public class Before
    {
        public class Employee
        {
            protected string name;
            protected string id;
        }

        public class Manager : Employee
        {
            private int grade;

            public Manager(string name, string id, int grade)
            {
                this.name = name;
                this.id = id;
                this.grade = grade;
            }
            // ...
        }
    }
}
