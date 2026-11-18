namespace SimplifyingConditionalExpressions_ConsolidateConditionalExpression
{
    public class Before
    {
        private int seniority;
        private int monthsDisabled;
        private bool isPartTime;

        double DisabilityAmount()
        {
            if (seniority < 2)
            {
                return 0;
            }
            if (monthsDisabled > 12)
            {
                return 0;
            }
            if (isPartTime)
            {
                return 0;
            }
            // Compute the disability amount.
            return 1000;
        }
    }
}
