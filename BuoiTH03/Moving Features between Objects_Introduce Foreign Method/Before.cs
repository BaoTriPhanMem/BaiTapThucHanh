using System;

namespace MovingFeaturesbetweenObjects_IntroduceForeignMethod
{
    public class Before
    {
        class Report
        {
            // ...
            void SendReport()
            {
                DateTime previousEnd = DateTime.Now;
                DateTime nextDay = previousEnd.AddDays(1);
                // ...
            }
        }
    }
}
