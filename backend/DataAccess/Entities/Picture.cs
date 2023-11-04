using DataAccess.Entities.Identity;

namespace DataAccess.Entities;

public class Picture : IDbModel<Guid>
{
    public Guid Id { get; set; }
    public string? StringValue { get; set; }

    public DateTime CreatedDateTime { get; set; }

    public User? User { get; set; }
    public Baby? Baby { get; set; }
    public Incubator? Incubator { get; set; }
}
public class UserPictureConfig : IEntityTypeConfiguration<Picture>
{
    public void Configure(EntityTypeBuilder<Picture> builder)
    {
        //Table Level
        builder.ToTable("Pictures", "Incubator");

        // Relationship level

        builder.HasOne(x => x.User)
            .WithOne(x => x.UserPicture)
            .HasForeignKey<User>(x => x.UserImgId);

        builder.HasOne(x => x.Baby)
            .WithOne(x => x.BabyPicture)
            .HasForeignKey<Baby>(x => x.BabyImgId);

        builder.HasOne(x => x.Incubator)
            .WithOne(x => x.IncubatorPicture)
            .HasForeignKey<Incubator>(x => x.IncubatorImgId);
    }
}