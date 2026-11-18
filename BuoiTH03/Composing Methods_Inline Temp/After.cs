namespace ComposingMethods_InlineMethod
{
    public class After
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
            return order.BasePrice() > 1000;
        }
    }
}
