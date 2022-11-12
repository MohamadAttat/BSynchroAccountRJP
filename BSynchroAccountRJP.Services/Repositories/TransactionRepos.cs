using BSynchroAccountRJP.Models.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using BSynchroAccountRJP.Utility.Infrastructure;
using BSynchroAccountRJP.Services.Infrastructure;

namespace BSynchroAccountRJP.Services.Repositories
{
    public class TransactionRepos : ITransaction
    {
        private readonly IRepository<Transaction> _repo;


        public TransactionRepos(IRepository<Transaction> repo)
        {
            _repo = repo;
        }

        public IEnumerable<Transaction> GetAll(Expression<Func<Transaction, bool>>? filter = null, Func<IQueryable<Transaction>, IOrderedQueryable<Transaction>>? orderBy = null, string includeProperties = "")
        {
            return _repo.GetAll(filter, orderBy, includeProperties);
        }

        public Transaction GetById(int Id, string includeProperties = "")
        {
            return _repo.GetById(Id, includeProperties);
        }

        public void Create(Transaction tr)
        {
            _repo.Create(tr);
        }

        public void Save()
        {
            _repo.Save();
        }
    }
}
