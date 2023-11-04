using DataAccess;
using Microsoft.EntityFrameworkCore;

namespace Domain.Repos
{
    public class IncubatorRepo : IDomainRepository<Incubator>
    {
        private readonly IncubatorDbContext _context;

        public IncubatorRepo(IncubatorDbContext context)
        {
            _context = context;
        }

        public void CreateModel(Incubator inc)
        {
            if(inc == null)
            {
                throw new ArgumentNullException(nameof(inc));
            }

            _context.Incubators.Add(inc);
        }

        public void DeleteModel(Incubator inc)
        {
            if(inc == null)
            {
                throw new ArgumentNullException(nameof(inc));
            }
            _context.Incubators.Remove(inc);
        }

        public IEnumerable<Incubator> GetAllModel()
            => _context.Incubators
                .Include(x =>x.Babies)!
                .ThenInclude(x => x.Mother)
                .Include(x => x.Babies)!
                .ThenInclude(x => x.Doctor)
                .Include(x => x.Babies)!
                .ThenInclude(x => x.Nurse)
                .ToList();

        public Incubator GetById(Guid id)
            => _context.Incubators
                .Include(x => x.Babies)!
                .ThenInclude(x => x.Mother)
                .Include(x => x.Babies)!
                .ThenInclude(x => x.Doctor)
                .Include(x => x.Babies)!
                .ThenInclude(x => x.Nurse)
                .FirstOrDefault(p => p.Id == id)!;

        public bool SaveChanges()
            => _context.SaveChanges() >= 0;

        public void UpdateModel(Incubator inc)
        {
            //Nothing
        }

        #region Dispose
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
            {
                _context.Dispose();
            }
        }
        #endregion
    }
}