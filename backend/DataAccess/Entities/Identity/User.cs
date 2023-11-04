using InfraStructure.Enums;

namespace DataAccess.Entities.Identity
{
    public class User : IdentityUser<Guid>, IDbModel<Guid>
    {
        public string Name { get; set; } = null!;
        public UserType Type { get; set; }
        public string? Ssn { get; set; } 
        public DateTime BirthDate { get; set; }
        public bool IsEmployee { get; set; }=false;
        public Guid EmployeeId { get; set; }
        public Employee? Employee { get; set; }

        public string? HospitalName { get; set; } = null!;
        public string? HospitalPhone { get; set; } = null!;

        public Guid? UserImgId { get; set; }
        public Picture? UserPicture { get; set; }

        public IEnumerable<Baby>? MotherBabies { get; set; } = null!;
        public IEnumerable<Baby>? DoctorBabies { get; set; } = null!;
        public IEnumerable<Baby>? NurseBabies { get; set; } = null!;
    }
    public class UserConfig : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            //Table Level
            builder.ToTable("Users", "User");

            //Properties Level
            builder.Property(x => x.Name).HasMaxLength(LimitsConfig.NameLength);
            builder.Property(x => x.Type).IsRequired();
            builder.Property(x => x.HospitalName).HasMaxLength(LimitsConfig.NameLength);


            // Relationship level

            builder.HasOne(x => x.Employee)
                .WithOne(x => x.User)
                .HasForeignKey<User>(x => x.EmployeeId);
        }
    }
}