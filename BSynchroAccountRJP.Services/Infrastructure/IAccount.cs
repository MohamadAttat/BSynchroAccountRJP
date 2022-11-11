using BSynchroAccountRJP.Models.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace BSynchroAccountRJP.Services.Infrastructure
{
    public interface IAccount
    {
        IEnumerable<Account> GetAll(Expression<Func<Account, bool>>? filter = null, Func<IQueryable<Account>, IOrderedQueryable<Account>>? orderBy = null, string includeProperties = "");
        Account GetById(int Id, string includeProperties = "");
        void Save();
    }
}
