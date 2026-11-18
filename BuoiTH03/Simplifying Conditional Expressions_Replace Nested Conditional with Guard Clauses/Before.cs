namespace SimplifyingConditionalExpressions_ReplaceNestedConditionalwithGuardClauses
{
    public class Before
    {
        private bool isDead;
        private bool isSeparated;
        private bool isRetired;

        double DeadAmount() { return 0; }
        double SeparatedAmount() { return 100; }
        double RetiredAmount() { return 200; }
        double NormalPayAmount() { return 500; }

        public double GetPayAmount()
        {
            double result;
            if (isDead)
            {
                result = DeadAmount();
            }
            else
            {
                if (isSeparated)
                {
                    result = SeparatedAmount();
                }
                else
                {
                    if (isRetired)
                    {
                        result = RetiredAmount();
                    }
                    else
                    {
                        result = NormalPayAmount();
                    }
                }
            }
            return result;
        }
    }
}
