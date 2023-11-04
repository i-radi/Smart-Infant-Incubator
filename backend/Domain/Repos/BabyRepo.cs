using DataAccess;
using Microsoft.EntityFrameworkCore;

namespace Domain.Repos;

public class BabyRepo : IDomainRepository<Baby>
{
    private readonly IncubatorDbContext _context;

    public BabyRepo(IncubatorDbContext context)
    {
        _context = context;
    }

    public void CreateModel(Baby baby)
    {
        if (baby == null)
        {
            throw new ArgumentNullException(nameof(baby));
        }
        var inc = _context.Incubators.FirstOrDefault(p => p.Id == baby.IncubatorId);
        inc!.IsEmpty = false;
        _context.Incubators.Update(inc);

        _context.Babies.Add(baby);
    }

    public void DeleteModel(Baby baby)
    {
        if (baby == null)
        {
            throw new ArgumentNullException(nameof(baby));
        }
        var inc = _context.Incubators.FirstOrDefault(p => p.Id == baby.IncubatorId);
        inc!.IsEmpty = true;
        _context.Incubators.Update(inc);
        baby.IsDeleted = true;
        _context.Babies.Update(baby);
    }

    public IEnumerable<Baby> GetAllModel()
        => _context.Babies.Where(b => b.IsDeleted == false)
        .Include(x => x.Doctor)
        .Include(x => x.Nurse)
        .Include(x => x.Mother)
        .ToList();

    public Baby GetById(Guid id)
        => _context.Babies.Where(b => b.IsDeleted == false)
        .Include(x => x.Doctor)
        .Include(x => x.Nurse)
        .Include(x => x.Mother)
        .FirstOrDefault(p => p.Id == id)!;


    public bool SaveChanges()
        => _context.SaveChanges() >= 0;

    public void UpdateModel(Baby baby)
    {
        _context.Babies.Update(baby);
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
