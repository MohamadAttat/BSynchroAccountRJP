using BSynchroAccountRJP.Models.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BSynchroAccountRJP.Models.Model
{
    public class Account : BaseEntity
    {
        public int CustomerId { get; set; }
        public decimal Balance { get; set; }
        public Customer Customer { get; set; }
        public IEnumerable<Transaction> Transactions { get; set; }

        public Account(int customerId,decimal balance = 0)
        {
            CustomerId = customerId;
            Balance = balance;
            DateCreated = DateTime.Now;
            DateUpdated = DateCreated;
        }
    }
}
