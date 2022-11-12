using BSynchroAccountRJP.Models.Model;
using BSynchroAccountRJP.Services.Infrastructure;
using BSynchroAccountRJP.Utility.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace BSynchroAccountRJP.Services.Repositories
{
    public class AccountRepos : IAccount
    {
        private readonly IRepository<Account> _repo;


        public AccountRepos(IRepository<Account> repo)
        {
            _repo = repo;
        }

        public IEnumerable<Account> GetAll(Expression<Func<Account, bool>>? filter = null, Func<IQueryable<Account>, IOrderedQueryable<Account>>? orderBy = null, string includeProperties = "")
        {
            return _repo.GetAll(filter, orderBy, includeProperties);
        }

        public Account GetById(int Id, string includeProperties = "")
        {
            return _repo.GetById(Id, includeProperties);
        }
        //creates a new account for the customer
        public void Create(Account acc)
        {
            _repo.Create(acc);
        }

        public void Save()
        {
            _repo.Save();
        }
    }
}
