namespace SimplifyingMethodCalls_ReplaceParameterwithExplicitMethods
{
    public class Before
    {
        private int height;
        private int width;

        void SetValue(string name, int value)
        {
            if (name.Equals("height"))
            {
                height = value;
                return;
            }
            if (name.Equals("width"))
            {
                width = value;
                return;
            }
            // Assert.Fail();
        }
    }
}
