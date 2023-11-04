using DataAccess;

namespace Domain.Repos;

public class EmployeeRepo : IDomainRepository<Employee>
{
    private readonly IncubatorDbContext _context;

    public EmployeeRepo(IncubatorDbContext context)
    {
        _context = context;
    }

    public void CreateModel(Employee employee)
    {
        if (employee == null)
        {
            throw new ArgumentNullException(nameof(employee));
        }

        _context.Employees.Add(employee);
    }

    public void DeleteModel(Employee employee)
    {
        if (employee == null)
        {
            throw new ArgumentNullException(nameof(employee));
        }
        _context.Employees.Remove(employee);
    }

    public IEnumerable<Employee> GetAllModel()
        => _context.Employees.ToList();

    public Employee GetById(Guid id)
        => _context.Employees.FirstOrDefault(p => p.Id == id)!;


    public bool SaveChanges()
        => _context.SaveChanges() >= 0;

    public void UpdateModel(Employee employee)
    {
        _context.Employees.Update(employee);
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
