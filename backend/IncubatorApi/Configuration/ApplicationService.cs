using DataAccess;
using DataAccess.Entities.Identity;
using Domain.Profiles;
using Domain.Repos;
using IncubatorApi.Configuration.RabbitMQ;
using IncubatorApi.Services.Auth;
using IncubatorApi.Services.IOTService;
using IncubatorApi.Services.Middlewares;
using Microsoft.AspNetCore.Authentication.JwtBearer;

namespace IncubatorApi.Configuration;

public static class ApplicationService
{
    public static IServiceCollection AddApplicationServices(this IServiceCollection services, IConfiguration config)
    {
        services.AddSingleton<RequestResponseLoggingMiddleware>();
        services.Configure<Jwt>(config.GetSection("JWT"));
        
        services.AddIdentity<User, IdentityRole<Guid>>()
            .AddEntityFrameworkStores<IncubatorDbContext>();
        
        services.AddScoped<IAuthService, AuthService>();
        
        services.AddAuthentication(options =>
        {
            options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
            options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
        }).AddJwtBearer(o =>
        {
            o.RequireHttpsMetadata = false;
            o.SaveToken = false;
            o.TokenValidationParameters = new TokenValidationParameters
            {
                ValidateIssuerSigningKey = true,
                ValidateIssuer = true,
                ValidateAudience = true,
                ValidateLifetime = true,
                ValidIssuer = config["JWT:Issuer"],
                ValidAudience = config["JWT:Audience"],
                IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(config["JWT:Key"]))
            };
        });

        services.AddSingleton(new MapperConfiguration(mc =>
        {
            mc.AddProfile(new IncubatorsProfile());
            mc.AllowNullCollections = true;
        }).CreateMapper());

        services.AddScoped<IDomainRepository<User>, UserRepo>();
        services.AddScoped<IDomainRepository<Baby>, BabyRepo>();
        services.AddScoped<IDomainRepository<Picture>, PictureRepo>();
        services.AddScoped<IDomainRepository<Employee>, EmployeeRepo>();
        services.AddScoped<IDomainRepository<Incubator>, IncubatorRepo>();

        //services.AddSingleton<Factory>();
        // services.AddSwaggerGen();

        services.AddSwaggerGen(c =>
        {
            c.SwaggerDoc("v1", new() {Title = "Incubator API", Version = "v1"});
            var jwtSecurityScheme = new OpenApiSecurityScheme
            {
                Scheme = "bearer",
                BearerFormat = "JWT",
                Name = "JWT Authentication",
                In = ParameterLocation.Header,
                Type = SecuritySchemeType.Http,
                Description = "Put **_ONLY_** your JWT Bearer token on textbox below!",

                Reference = new OpenApiReference
                {
                    Id = JwtBearerDefaults.AuthenticationScheme,
                    Type = ReferenceType.SecurityScheme
                }
            };

            c.AddSecurityDefinition(jwtSecurityScheme.Reference.Id, jwtSecurityScheme);

            c.AddSecurityRequirement(new OpenApiSecurityRequirement
            {
                {jwtSecurityScheme, Array.Empty<string>()}
            });

        });


        services.AddDbContext<IncubatorDbContext>((provider, optionsBuilder) =>
            IncubatorDbDesigner.SetConfiguration<IncubatorDbContext>(provider, optionsBuilder, 
                config.GetConnectionString("IncubatorConnection")));
       
        return services;
    }
}