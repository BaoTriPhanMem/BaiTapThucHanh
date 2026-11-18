namespace ComposingMethods_ReplaceTempwithQuery
{
    public class Before
    {
        private int quantity;
        private double itemPrice;

        double CalculateTotal()
        {
            double basePrice = quantity * itemPrice;

            if (basePrice > 1000)
            {
                return basePrice * 0.95;
            }
            else
            {
                return basePrice * 0.98;
            }
        }
    }
}
