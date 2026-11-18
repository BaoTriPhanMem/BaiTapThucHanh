namespace ComposingMethods_InlineMethod
{
    public class Before
    {
        private int numberOfLateDeliveries;

        int GetRating()
        {
            return MoreThanFiveLateDeliveries() ? 2 : 1;
        }

        bool MoreThanFiveLateDeliveries()
        {
            return numberOfLateDeliveries > 5;
        }
    }
}
