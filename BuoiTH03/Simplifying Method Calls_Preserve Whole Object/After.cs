namespace SimplifyingMethodCalls_PreserveWholeObject
{
    public class After
    {
        public class TempRange
        {
            public int GetLow() { return 10; }
            public int GetHigh() { return 30; }
        }

        public class Plan
        {
            public bool WithinRange(TempRange range)
            {
                return range.GetLow() >= 5 && range.GetHigh() <= 35;
            }
        }

        void Example()
        {
            TempRange daysTempRange = new TempRange();
            Plan plan = new Plan();

            bool withinPlan = plan.WithinRange(daysTempRange);
        }
    }
}
