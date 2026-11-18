namespace ComposingMethods_ExtractVariable
{
    public class Before
    {
        private string platform;
        private string browser;
        private int resize;

        void RenderBanner()
        {
            if ((platform.ToUpper().IndexOf("MAC") > -1) &&
                (browser.ToUpper().IndexOf("IE") > -1) &&
                wasInitialized() && resize > 0)
            {
                // do something
            }
        }

        private bool wasInitialized()
        {
            return true;
        }
    }
}
