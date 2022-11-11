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
    public class CustomerRepos:ICustomer
    {
        private readonly IRepository<Customer> _repo;


        public CustomerRepos(IRepository<Customer> repo)
        {
            _repo = repo;
        }

        public IEnumerable<Customer> GetAll(Expression<Func<Customer, bool>>? filter = null, Func<IQueryable<Customer>, IOrderedQueryable<Customer>>? orderBy = null, string includeProperties = "")
        {
            return _repo.GetAll(filter, orderBy, includeProperties);
        }

        public Customer GetById(int Id, string includeProperties = "")
        {
            return _repo.GetById(Id, includeProperties);
        }

        public void Save()
        {
            _repo.Save();
        }
    }
}
