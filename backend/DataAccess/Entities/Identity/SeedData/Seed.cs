using System.Text.Json;

namespace DataAccess.Entities.Identity.SeedData
{
    public class Seed
    {
        public static async Task SeedUsers(UserManager<User> userManager,
            RoleManager<IdentityRole<Guid>> roleManager,
            IncubatorDbContext context)
        {
            if (await userManager.Users.AnyAsync()) return;

            var roles = new List<IdentityRole<Guid>>
            {
                new IdentityRole<Guid>{Name = "Admin"},
                new IdentityRole<Guid>{Name = "Operator"},
                new IdentityRole<Guid>{Name = "Doctor"},
                new IdentityRole<Guid>{Name = "Nurse"},
                new IdentityRole<Guid>{Name = "Mother"}
            };

            foreach (var role in roles)
            {
                await roleManager.CreateAsync(role);
            }

            var adminData = await File.ReadAllTextAsync("Entities/Identity/SeedData/Admin.json");
            var admin = JsonSerializer.Deserialize<List<User>>(adminData)?.FirstOrDefault();
            if (admin == null) return;
            admin.UserName = admin.UserName.ToLower();
            await userManager.CreateAsync(admin, "Pa$$w0rd");
            await userManager.AddToRoleAsync(admin, "Admin");

            var operatorData = await File.ReadAllTextAsync("Entities/Identity/SeedData/Operator.json");
            var operators = JsonSerializer.Deserialize<List<User>>(operatorData);
            if (operators == null) return;
            foreach (var user in operators)
            {
                user.UserName = user.UserName.ToLower();
                await userManager.CreateAsync(user, "Pa$$w0rd");
                await userManager.AddToRoleAsync(user, "Operator");
            }

            var doctorData = await File.ReadAllTextAsync("Entities/Identity/SeedData/Doctor.json");
            var doctors = JsonSerializer.Deserialize<List<User>>(doctorData);
            if (doctors == null) return;
            foreach (var user in doctors)
            {
                user.UserName = user.UserName.ToLower();
                await userManager.CreateAsync(user, "Pa$$w0rd");
                await userManager.AddToRoleAsync(user, "Doctor");
            }

            var nurseData = await File.ReadAllTextAsync("Entities/Identity/SeedData/Nurse.json");
            var nurses = JsonSerializer.Deserialize<List<User>>(nurseData);
            if (nurses == null) return;
            foreach (var user in nurses)
            {
                user.UserName = user.UserName.ToLower();
                await userManager.CreateAsync(user, "Pa$$w0rd");
                await userManager.AddToRoleAsync(user, "Nurse");
            }

            var motherData = await File.ReadAllTextAsync("Entities/Identity/SeedData/Mother.json");
            var mothers = JsonSerializer.Deserialize<List<User>>(motherData);
            if (mothers == null) return;
            foreach (var user in mothers)
            {
                user.UserName = user.UserName.ToLower();
                await userManager.CreateAsync(user, "Pa$$w0rd");
                await userManager.AddToRoleAsync(user, "Mother");
            }
        }
    }
}
