namespace SimplifyingMethodCalls_ReplaceExceptionwithTest
{
    public class After
    {
        private double[] values = { 10, 20, 30 };

        double GetValueForPeriod(int periodNumber)
        {
            if (periodNumber >= values.Length)
            {
                return 0;
            }
            return values[periodNumber];
        }
    }
}
