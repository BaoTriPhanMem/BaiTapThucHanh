namespace SimplifyingMethodCalls_PreserveWholeObject
{
    public class Before
    {
        public class TempRange
        {
            public int GetLow() { return 10; }
            public int GetHigh() { return 30; }
        }

        public class Plan
        {
            public bool WithinRange(int low, int high)
            {
                return low >= 5 && high <= 35;
            }
        }

        void Example()
        {
            TempRange daysTempRange = new TempRange();
            Plan plan = new Plan();

            int low = daysTempRange.GetLow();
            int high = daysTempRange.GetHigh();
            bool withinPlan = plan.WithinRange(low, high);
        }
    }
}
