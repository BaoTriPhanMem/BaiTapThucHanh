namespace SimplifyingConditionalExpressions_ConsolidateConditionalExpression
{
    public class After
    {
        private int seniority;
        private int monthsDisabled;
        private bool isPartTime;

        double DisabilityAmount()
        {
            if (IsNotEligibleForDisability())
            {
                return 0;
            }
            // Compute the disability amount.
            return 1000;
        }

        bool IsNotEligibleForDisability()
        {
            return seniority < 2 || monthsDisabled > 12 || isPartTime;
        }
    }
}
