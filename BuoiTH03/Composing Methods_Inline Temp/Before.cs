namespace ComposingMethods_InlineMethod
{
    public class Before
    {
        // Giả lập Order để khớp với ví dụ mẫu
        public class Order
        {
            public double BasePrice()
            {
                return 1500;
            }
        }

        bool HasDiscount(Order order)
        {
            double basePrice = order.BasePrice();
            return basePrice > 1000;
        }
    }
}
