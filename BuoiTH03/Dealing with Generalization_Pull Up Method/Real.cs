namespace DealingwithGeneralization_PullUpMethod
{
    public class Real
    {
        public abstract class Shape
        {
            public abstract decimal GetArea();
            public abstract decimal GetPerimeter();
        }

        public class Circle : Shape
        {
            private decimal radius;

            public Circle(decimal r) { radius = r; }

            public override decimal GetArea()
            {
                return 3.14159m * radius * radius;
            }

            public override decimal GetPerimeter()
            {
                return 2 * 3.14159m * radius;
            }
        }

        public class Rectangle : Shape
        {
            private decimal width, height;

            public Rectangle(decimal w, decimal h) { width = w; height = h; }

            public override decimal GetArea()
            {
                return width * height;
            }

            public override decimal GetPerimeter()
            {
                return 2 * (width + height);
            }
        }
    }
}

