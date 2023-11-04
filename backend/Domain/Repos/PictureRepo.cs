using DataAccess;

namespace Domain.Repos;

public class PictureRepo : IDomainRepository<Picture>
{
    private readonly IncubatorDbContext _context;

    public PictureRepo(IncubatorDbContext context)
    {
        _context = context;
    }

    public void CreateModel(Picture picture)
    {
        if (picture == null)
        {
            throw new ArgumentNullException(nameof(picture));
        }

        _context.Pictures.Add(picture);
    }

    public void DeleteModel(Picture picture)
    {
        if (picture == null)
        {
            throw new ArgumentNullException(nameof(picture));
        }
        _context.Pictures.Remove(picture);
    }

    public IEnumerable<Picture> GetAllModel()
        => _context.Pictures.ToList();

    public Picture GetById(Guid id)
        => _context.Pictures.FirstOrDefault(p => p.Id == id)!;


    public bool SaveChanges()
        => _context.SaveChanges() >= 0;

    public void UpdateModel(Picture picture)
        => _context.Pictures.Update(picture);

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
