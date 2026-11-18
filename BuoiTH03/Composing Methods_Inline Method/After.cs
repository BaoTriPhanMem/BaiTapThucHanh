namespace ComposingMethods_InlineMethod
{
    public class After
    {
        private int numberOfLateDeliveries;

        int GetRating()
        {
            return numberOfLateDeliveries > 5 ? 2 : 1;
        }
    }
}
