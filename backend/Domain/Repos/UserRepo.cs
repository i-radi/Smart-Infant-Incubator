using DataAccess;
using DataAccess.Entities.Identity;
using Microsoft.EntityFrameworkCore;

namespace Domain.Repos;

public class UserRepo : IDomainRepository<User>
{
    private readonly IncubatorDbContext _context;

    public UserRepo(IncubatorDbContext context)
    {
        _context = context;
    }

    public void CreateModel(User user)
    {
        if (user == null)
        {
            throw new ArgumentNullException(nameof(user));
        }

        _context.Users.Add(user);
    }

    public void DeleteModel(User user)
    {
        if (user == null)
        {
            throw new ArgumentNullException(nameof(user));
        }
        _context.Users.Remove(user);
    }

    public IEnumerable<User> GetAllModel()
        => _context.Users
        .Include(x => x.Employee)
        .ToList();

    public User GetById(Guid id)
        => _context.Users
            .Include(x => x.Employee)
            .Include(x => x.DoctorBabies)
            .Include(x => x.NurseBabies)
            .Include(x => x.MotherBabies)
            .FirstOrDefault(p => p.Id == id)!;


    public bool SaveChanges()
        => _context.SaveChanges() >= 0;

    public void UpdateModel(User user)
    {
        _context.Users.Update(user);
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
