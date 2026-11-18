using System.Diagnostics;

namespace SimplifyingConditionalExpressions_IntroduceAssertion
{
    public class After
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
            Debug.Assert(expenseLimit != NULL_EXPENSE || primaryProject != null);

            return (expenseLimit != NULL_EXPENSE) ?
                expenseLimit :
                primaryProject.GetMemberExpenseLimit();
        }
    }
}
