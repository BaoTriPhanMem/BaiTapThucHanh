namespace ComposingMethods_RemoveAssignmentstoParameters
{
    public class After
    {
        int Discount(int inputVal, int quantity)
        {
            int result = inputVal;

            if (quantity > 50)
            {
                result -= 2;
            }
            // ...
            return result;
        }
    }
}
