namespace ComposingMethods_ReplaceMethodwithMethodObject
{
    public class Before
    {
        public class Order
        {
            // ...
            public double Price()
            {
                double primaryBasePrice;
                double secondaryBasePrice;
                double tertiaryBasePrice;
                // Perform long computation.
                return 0.0;
            }
        }
    }
}
