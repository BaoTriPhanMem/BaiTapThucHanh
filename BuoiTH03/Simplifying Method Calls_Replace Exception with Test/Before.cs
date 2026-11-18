using System;

namespace SimplifyingMethodCalls_ReplaceExceptionwithTest
{
    public class Before
    {
        private double[] values = { 10, 20, 30 };

        double GetValueForPeriod(int periodNumber)
        {
            try
            {
                return values[periodNumber];
            }
            catch (IndexOutOfRangeException e)
            {
                return 0;
            }
        }
    }
}
