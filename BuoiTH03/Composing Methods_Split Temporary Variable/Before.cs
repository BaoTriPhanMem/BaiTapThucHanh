namespace ComposingMethods_SplitTemporaryVariable
{
    public class Before
    {
        private double height;
        private double width;

        void PrintValues()
        {
            double temp = 2 * (height + width);
            Console.WriteLine(temp);
            temp = height * width;
            Console.WriteLine(temp);
        }
    }
}
