using BSynchroAccountRJP.Models.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace BSynchroAccountRJP.Services.Infrastructure
{
    public interface ICustomer
    {
        IEnumerable<Customer> GetAll(Expression<Func<Customer, bool>>? filter = null, Func<IQueryable<Customer>, IOrderedQueryable<Customer>>? orderBy = null, string includeProperties = "");
        Customer GetById(int Id, string includeProperties = "");
        void Save();
    }
}
