using System;

namespace SimplifyingMethodCalls_ReplaceErrorCodewithException
{
    public class After
    {
        private int _balance = 1000;

        /// <exception cref="BalanceException">Thrown when amount > _balance</exception>
        void Withdraw(int amount)
        {
            if (amount > _balance)
            {
                throw new BalanceException();
            }
            _balance -= amount;
        }
    }

    public class BalanceException : Exception
    {
        public BalanceException() : base("Số dư không đủ") { }
    }
}
