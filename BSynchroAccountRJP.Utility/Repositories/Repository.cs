using BSynchroAccountRJP.Models.Entity;
using BSynchroAccountRJP.Utility.Data;
using BSynchroAccountRJP.Utility.Infrastructure;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace BSynchroAccountRJP.Utility.Repositories
{
    public class Repository<T> : IRepository<T> where T : BaseEntity
    {
        private readonly AppDBContext _context;
        private readonly DbSet<T> entities;

        public Repository(AppDBContext context)
        {
            _context = context;
            entities = _context.Set<T>();
        }

        /**
         * GetAll Entities with optional filtering and ordering and including children
         * filter: is an expression such as x=>x.z = 1 for example
         * orderBy is an ordering function to be used if not null
         * includeProperties is a comma separated string object properties names to be included in the query if not empty
         */
        public virtual IEnumerable<T> GetAll(
            Expression<Func<T, bool>>? filter = null,
            Func<IQueryable<T>, IOrderedQueryable<T>>? orderBy = null,
            string includeProperties = ""
            )
        {
            IQueryable<T> query = entities;

            if (filter != null)
            {
                query = query.Where(filter);
            }

            foreach (var includeProperty in includeProperties.Split
                (new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries))
            {
                query = query.Include(includeProperty.Trim());
            }

            if (orderBy != null)
            {
                return orderBy(query).ToList();
            }
            else
            {
                return query.ToList();
            }
            //return entities.AsQueryable<T>();
        }

        /**
         * includeProperties is a comma separated string object properties names to be included in the query if not empty
         */
        public virtual T GetById(int Id, string includeProperties = "")
        {
            IQueryable<T> query = entities;

            foreach (var includeProperty in includeProperties.Split
                (new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries))
            {
                query = query.Include(includeProperty);
            }
            return query.FirstOrDefault(x => x.Id == Id);
            //return entities.Find(Id);
        }


        public virtual void Create(T entity)
        {
            entities.Add(entity);
        }
        public virtual void Update(T entity)
        {
            entities.Attach(entity);
            _context.Entry(entity).State = EntityState.Modified;
        }
        public virtual void Delete(object id)
        {
            T? entityToDelete = entities.Find(id);
            Delete(entityToDelete);
            //entities.Remove(entity);
        }
        public virtual void Delete(T? entityToDelete)
        {
            if (entityToDelete != null)
            {
                if (_context.Entry(entityToDelete).State == EntityState.Detached)
                {
                    entities.Attach(entityToDelete);
                }
                entities.Remove(entityToDelete);
            }
        }
        public virtual void Save()
        {
            _context.SaveChanges();
        }
    }

}
