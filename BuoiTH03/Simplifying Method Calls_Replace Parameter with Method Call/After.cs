namespace SimplifyingMethodCalls_ReplaceParameterwithMethodCall
{
    public class After
    {
        private int quantity;
        private int itemPrice;

        double GetSeasonalDiscount() { return 0.1; }
        double GetFees() { return 5.0; }

        double DiscountedPrice(int basePrice)
        {
            double seasonDiscount = this.GetSeasonalDiscount();
            double fees = this.GetFees();
            return basePrice * (1 - seasonDiscount) + fees;
        }

        void Example()
        {
            int basePrice = quantity * itemPrice;
            double finalPrice = DiscountedPrice(basePrice);
        }
    }
}
