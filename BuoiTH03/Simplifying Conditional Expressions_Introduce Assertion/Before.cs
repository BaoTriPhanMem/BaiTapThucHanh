namespace SimplifyingConditionalExpressions_IntroduceAssertion
{
    public class Before
    {
        private const double NULL_EXPENSE = -1;
        private double expenseLimit = NULL_EXPENSE;
        private Project primaryProject;

        public class Project
        {
            public double GetMemberExpenseLimit() { return 1000; }
        }

        double GetExpenseLimit()
        {
            // Should have either expense limit or a primary project.
            return (expenseLimit != NULL_EXPENSE) ?
                expenseLimit :
                primaryProject.GetMemberExpenseLimit();
        }
    }
}
