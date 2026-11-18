namespace ComposingMethods_SplitTemporaryVariable
{
    public class After
    {
        private double height;
        private double width;

        void PrintValues()
        {
            double perimeter = 2 * (height + width);
            Console.WriteLine(perimeter);

            double area = height * width;
            Console.WriteLine(area);
        }
    }
}
