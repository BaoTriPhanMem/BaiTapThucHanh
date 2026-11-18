namespace SimplifyingConditionalExpressions_ConsolidateDuplicateConditionalFragments
{
    public class After
    {
        private double price;
        private double total;

        bool IsSpecialDeal() { return true; }
        void Send() { }

        void Example()
        {
            if (IsSpecialDeal())
            {
                total = price * 0.95;
            }
            else
            {
                total = price * 0.98;
            }
            Send();
        }
    }
}
