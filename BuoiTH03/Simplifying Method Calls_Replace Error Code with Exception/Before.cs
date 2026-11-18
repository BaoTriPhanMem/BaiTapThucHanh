namespace SimplifyingMethodCalls_ReplaceErrorCodewithException
{
    public class Before
    {
        private int _balance = 1000;

        int Withdraw(int amount)
        {
            if (amount > _balance)
            {
                return -1;
            }
            else
            {
                _balance -= amount;
                return 0;
            }
        }
    }
}
