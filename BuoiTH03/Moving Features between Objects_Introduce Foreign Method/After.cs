using System;

namespace MovingFeaturesbetweenObjects_IntroduceForeignMethod
{
    public class After
    {
        class Report
        {
            // ...
            void SendReport()
            {
                DateTime previousEnd = DateTime.Now;
                DateTime nextDay = NextDay(previousEnd);
                // ...
            }

            private static DateTime NextDay(DateTime date)
            {
                return date.AddDays(1);
            }
        }
    }
}
