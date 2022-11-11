using BSynchroAccountRJP.Models.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace BSynchroAccountRJP.Utility.Infrastructure
{
    public interface IRepository<T> where T : BaseEntity
    {
        IEnumerable<T> GetAll(Expression<Func<T, bool>>? filter = null, Func<IQueryable<T>, IOrderedQueryable<T>>? orderBy = null, string includeProperties = "");
        T GetById(int Id, string includeProperties = "");
        void Create(T entity);
        void Update(T entity);
        void Delete(object id);
        void Delete(T? entity);
        void Save();

    }
}
