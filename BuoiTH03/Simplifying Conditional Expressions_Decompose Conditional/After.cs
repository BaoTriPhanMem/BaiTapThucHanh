namespace SimplifyingConditionalExpressions_DecomposeConditional
{
    public class After
    {
        private DateTime SUMMER_START = new DateTime(2026, 6, 1);
        private DateTime SUMMER_END = new DateTime(2026, 8, 31);
        private double winterRate = 1.2;
        private double winterServiceCharge = 10;
        private double summerRate = 1.0;

        double CalculateCharge(DateTime date, int quantity)
        {
            double charge;
            if (IsSummer(date))
            {
                charge = SummerCharge(quantity);
            }
            else
            {
                charge = WinterCharge(quantity);
            }
            return charge;
        }

        bool IsSummer(DateTime date)
        {
            return date >= SUMMER_START && date <= SUMMER_END;
        }

        double SummerCharge(int quantity)
        {
            return quantity * summerRate;
        }

        double WinterCharge(int quantity)
        {
            return quantity * winterRate + winterServiceCharge;
        }
    }
}
