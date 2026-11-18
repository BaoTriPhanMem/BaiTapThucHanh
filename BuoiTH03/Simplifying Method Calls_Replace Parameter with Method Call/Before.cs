namespace SimplifyingMethodCalls_ReplaceParameterwithMethodCall
{
    public class Before
    {
        private int quantity;
        private int itemPrice;

        double GetSeasonalDiscount() { return 0.1; }
        double GetFees() { return 5.0; }

        double DiscountedPrice(int basePrice, double seasonDiscount, double fees)
        {
            return basePrice * (1 - seasonDiscount) + fees;
        }

        void Example()
        {
            int basePrice = quantity * itemPrice;
            double seasonDiscount = this.GetSeasonalDiscount();
            double fees = this.GetFees();
            double finalPrice = DiscountedPrice(basePrice, seasonDiscount, fees);
        }
    }
}
