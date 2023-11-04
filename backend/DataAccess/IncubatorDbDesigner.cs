using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Logging;

namespace DataAccess;

public class IncubatorDbDesigner : IDesignTimeDbContextFactory<IncubatorDbContext>
{
    public static DbContextOptionsBuilder SetConfiguration<TContext>(IServiceProvider provider,
        DbContextOptionsBuilder builder, string connectionString)
        where TContext : DbContext
    {
        if (builder is DbContextOptionsBuilder<TContext> gBuilder)
            return SetConfiguration(gBuilder, connectionString, provider);
        return builder;
    }

    public static DbContextOptionsBuilder<TContext> SetConfiguration<TContext>(
        DbContextOptionsBuilder<TContext> builder, string connectionString, IServiceProvider? provider = null)
        where TContext : DbContext
    {
        builder.UseSqlServer(connectionString, options =>
        {
            options.EnableRetryOnFailure(3);
            options.CommandTimeout(45);
        });
#if DEBUG
        builder.EnableSensitiveDataLogging()
            .LogTo(Console.WriteLine, LogLevel.Information)
            .EnableDetailedErrors();
#endif
        return builder;
    }


    public IncubatorDbContext CreateDbContext(string[] args)
    {
        var optionsBuilder = SetConfiguration(new DbContextOptionsBuilder<IncubatorDbContext>(),
            "Server=.;Initial Catalog=IncubatorDB;Trusted_Connection=True ;MultipleActiveResultSets=true; ");
        return new IncubatorDbContext(optionsBuilder.Options);
    }
}