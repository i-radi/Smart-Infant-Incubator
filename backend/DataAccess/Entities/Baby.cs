using DataAccess.Entities.Identity;

namespace DataAccess.Entities;

public class Baby : IDbModel<Guid>
{
    public Guid Id { get; set; }

    public string Gender { get; set; } = null!;
    public DateTime BirthDate { get; set; }
    public string BabyCode { get; set; } = null!;
    public bool IsDeleted { get; set; }

    public Guid? BabyImgId { get; set; }
    public Picture? BabyPicture { get; set; }

    public Guid? IncubatorId { get; set; }
    public Incubator? Incubator { get; set; } = null!;
    public Guid? MotherId { get; set; }
    public User? Mother { get; set; } = null!;
    public Guid? DoctorId { get; set; }
    public User? Doctor { get; set; } = null!;
    public Guid? NurseId { get; set; }
    public User? Nurse { get; set; } = null!;
}
public class BabyConfig : IEntityTypeConfiguration<Baby>
{
    public void Configure(EntityTypeBuilder<Baby> builder)
    {
        //Table Level
        builder.ToTable("Babies", "Incubator");

        //Properties Level
        builder.Property(x => x.Id).IsRequired();
        builder.Property(x => x.BabyCode).HasMaxLength(LimitsConfig.Code);
        builder.Property(x => x.BirthDate).IsRequired();
        builder.Property(x => x.Gender).IsRequired();
        builder.Property(x => x.IncubatorId).IsRequired();

        // Relationship level
        builder.HasOne(x => x.Incubator)
            .WithMany(x => x.Babies)
            .HasForeignKey(x => x.IncubatorId);
        
        builder.HasOne(x => x.Mother)
            .WithMany(x => x.MotherBabies)
            .HasForeignKey(x => x.MotherId);
        
        builder.HasOne(x => x.Doctor)
            .WithMany(x => x.DoctorBabies)
            .HasForeignKey(x => x.DoctorId);
        
        builder.HasOne(x => x.Nurse)
            .WithMany(x => x.NurseBabies)
            .HasForeignKey(x => x.NurseId);
    }
}