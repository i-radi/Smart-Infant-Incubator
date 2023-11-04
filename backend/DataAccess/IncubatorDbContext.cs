using DataAccess.Entities;
using DataAccess.Entities.Identity;

namespace DataAccess
{
    public class IncubatorDbContext :
        IdentityDbContext<User, IdentityRole<Guid>, Guid, IdentityUserClaim<Guid>, IdentityUserRole<Guid>, IdentityUserLogin<Guid>, IdentityRoleClaim<Guid>, IdentityUserToken<Guid>>
    {
        public IncubatorDbContext(DbContextOptions<IncubatorDbContext> options) : base(options)
        {
        }
        public DbSet<Incubator> Incubators { get; set; } = null!;
        public DbSet<Baby> Babies { get; set; } = null!;
        public DbSet<Employee> Employees { get; set; } = null!;
        public DbSet<Picture> Pictures { get; set; } = null!;

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            //Apply All Configuration classes written in Fluent API after Every Entity
            var typesToRegister = GetType().Assembly
                .GetTypes()
                .Where(type => type.GetInterfaces()
                    .Any(i => i.IsGenericType &&
                              i.GetGenericTypeDefinition() == typeof(IEntityTypeConfiguration<>)));
            foreach (Type type in typesToRegister)
            {
                dynamic configurationInstance = Activator.CreateInstance(type)!;
                if (configurationInstance != null)
                    modelBuilder.ApplyConfiguration(configurationInstance);
            }

            //Change Identity Schema and Table Names
            modelBuilder.Entity<IdentityRole<Guid>>().ToTable("Roles", "User");
            modelBuilder.Entity<IdentityUserRole<Guid>>().ToTable("UserRoles", "User");
            modelBuilder.Entity<IdentityUserClaim<Guid>>().ToTable("UserClaims", "User");
            modelBuilder.Entity<IdentityUserLogin<Guid>>().ToTable("UserLogins", "User");
            modelBuilder.Entity<IdentityRoleClaim<Guid>>().ToTable("RoleClaims", "User");
            modelBuilder.Entity<IdentityUserToken<Guid>>().ToTable("UserTokens", "User");
        }
    }
}