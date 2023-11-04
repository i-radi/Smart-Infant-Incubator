namespace DataAccess.Entities
{
    public class Incubator : IDbModel<Guid>
    {
        public Guid Id { get; set; }
        public string IncubatorCode { get; set; } = null!;
        public bool IsEmpty { get; set; }
        public Guid? IncubatorImgId { get; set; }
        public Picture? IncubatorPicture { get; set; }

        public IEnumerable<Baby>? Babies { get; set; } = null!;
        
    }
    public class IncubatorConfig : IEntityTypeConfiguration<Incubator>
    {
        public void Configure(EntityTypeBuilder<Incubator> builder)
        {
            //Table Level
            builder.ToTable("Incubators", "Incubator");

            //Properties Level
            builder.Property(x => x.Id).IsRequired();
            builder.Property(x => x.IncubatorCode).HasMaxLength(LimitsConfig.Code);

            // Relationship level
        }
    }
}