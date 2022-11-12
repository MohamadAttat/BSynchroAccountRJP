using BSynchroAccountRJP.Models.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BSynchroAccountRJP.Models.Model
{
    public class Transaction : BaseEntity
    {
        public int AccountId { get; set; }
        public decimal Amount { get; set; }
        //deposit or withdraw 
        public string Type { get; set; }
        public virtual Account Account { get; set; }

        public Transaction(int accountId, decimal amount = 0, string type= "deposit")
        {
            AccountId = accountId;
            Amount = amount;
            Type = type;
            DateCreated = DateTime.Now;
            DateUpdated = DateCreated;
        }
    }
}
