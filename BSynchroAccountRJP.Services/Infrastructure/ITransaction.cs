using BSynchroAccountRJP.Models.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace BSynchroAccountRJP.Services.Infrastructure
{
    public interface ITransaction
    {
        IEnumerable<Transaction> GetAll(Expression<Func<Transaction, bool>>? filter = null, Func<IQueryable<Transaction>, IOrderedQueryable<Transaction>>? orderBy = null, string includeProperties = "");
        Transaction GetById(int Id, string includeProperties = "");
        void Create(Transaction tr);
        void Save();
    }
}
