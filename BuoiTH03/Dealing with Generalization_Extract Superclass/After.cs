namespace DealingwithGeneralization_ExtractSuperclass
{
    public class After
    {
        public abstract class Animal
        {
            public string Name { get; set; }
            public virtual void Eat() { Console.WriteLine("Eating..."); }
            public virtual void Sleep() { Console.WriteLine("Sleeping..."); }
        }

        public class Cat : Animal
        {
        }

        public class Dog : Animal
        {
        }
    }
}

