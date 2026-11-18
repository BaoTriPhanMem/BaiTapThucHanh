namespace ComposingMethods_ExtractVariable
{
    public class After
    {
        private string platform;
        private string browser;
        private int resize;

        void RenderBanner()
        {
            bool isMacOs = platform.ToUpper().IndexOf("MAC") > -1;
            bool isIE = browser.ToUpper().IndexOf("IE") > -1;
            bool wasResized = resize > 0;

            if (isMacOs && isIE && wasInitialized() && wasResized)
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
