namespace SimplifyingConditionalExpressions_ReplaceNestedConditionalwithGuardClauses
{
    public class After
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
            if (isDead)
            {
                return DeadAmount();
            }
            if (isSeparated)
            {
                return SeparatedAmount();
            }
            if (isRetired)
            {
                return RetiredAmount();
            }
            return NormalPayAmount();
        }
    }
}
