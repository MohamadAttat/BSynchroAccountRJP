using BSynchroAccountRJP.Models.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BSynchroAccountRJP.Models.Model
{
    public class Customer : BaseEntity
    {
        public string Name { get; set; }
        public string Surname { get; set; }
        public IEnumerable<Account> Accounts { get; set; }
    }
}
