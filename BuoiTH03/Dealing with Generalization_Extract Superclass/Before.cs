namespace DealingwithGeneralization_ExtractSuperclass
{
    public class Before
    {
        public class Cat
        {
            public string Name { get; set; }
            public void Eat() { Console.WriteLine("Eating..."); }
            public void Sleep() { Console.WriteLine("Sleeping..."); }
        }

        public class Dog
        {
            public string Name { get; set; }
            public void Eat() { Console.WriteLine("Eating..."); }
            public void Sleep() { Console.WriteLine("Sleeping..."); }
        }
    }
}

