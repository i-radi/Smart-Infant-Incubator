using Serilog;

namespace IncubatorApi;
public static class Program
{
    public static async Task Main(string[] args)
    {
        Log.Logger = new LoggerConfiguration()
            .WriteTo.Console()
            .CreateBootstrapLogger();

        try
        {
            Log.Information("Starting web host");
            var host = CreateHostBuilder(args).Build();
            using var scope = host.Services.CreateScope();
            // var services = scope.ServiceProvider;
            /*
            try
            {
                var context = services.GetRequiredService<IncubatorDbContext>();
                //var userManager = services.GetRequiredService<UserManager<User>>();
                //var roleManager = services.GetRequiredService<RoleManager<Role>>();
                //await context.Database.MigrateAsync();
                //await Seed.SeedUsers(userManager, roleManager, context);
            }
            catch (Exception ex)
            {
                var logger = services.GetRequiredService<ILogger<Program>>();
                logger.LogError(ex, "An error occurred during migration");
            }
            */
            await host.RunAsync();
        }
        catch (Exception ex)
        {
            Log.Fatal(ex, "Host terminated unexpectedly");
        }
        finally
        {
            Log.CloseAndFlush();
        }
    }

    public static IHostBuilder CreateHostBuilder(string[] args) =>
        Host.CreateDefaultBuilder(args)
            .UseSerilog((context, services, configuration) => configuration
                .ReadFrom.Configuration(context.Configuration)
                .ReadFrom.Services(services))
            .ConfigureWebHostDefaults(webBuilder =>
            {
                webBuilder.UseStartup<Startup>();
            });
}