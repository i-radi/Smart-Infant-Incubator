using DataAccess.Entities.Identity;

namespace DataAccess.Entities;

public class Employee : IDbModel<Guid>
{
    public Guid Id { get; set; }
    public string? University { get; set; } = null!;
    public string? DegreeOfPromotion { get; set; } = null!;
    public string? Specialization { get; set; } = null!;
    public User User { get; set; } = null!;
}
public class EmployeeConfig : IEntityTypeConfiguration<Employee>
{
    public void Configure(EntityTypeBuilder<Employee> builder)
    {
        //Table Level
        builder.ToTable("Employees", "Incubator");

        //Properties Level
        //builder.HasKey(x => x.UserId);


        // Relationship level

    }
}