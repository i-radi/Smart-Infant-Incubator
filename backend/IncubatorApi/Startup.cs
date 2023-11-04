using System.Text.Json.Serialization;
using IncubatorApi.Configuration;
using IncubatorApi.Services.IOTService;
using IncubatorApi.Services.Middlewares;
using Microsoft.ML.OnnxRuntime;
using Serilog;

namespace IncubatorApi;

public class Startup
    {
        private readonly IConfiguration _config;

        public Startup(IConfiguration config)
        {
            _config = config;
        }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
        Dictionary<string, InferenceSession> inferenceSessions = new Dictionary<string, InferenceSession>{
                { "hungry", new InferenceSession("Services/ONNX/hungry.onnx") },
                { "4classes", new InferenceSession("Services/ONNX/4classes.onnx") },
            };

        services.AddSingleton(inferenceSessions);
        services.AddApplicationServices(_config);
        services.AddCors(options =>
        {
            options.AddPolicy("AllowAll",
                builder =>
                {
                    builder
                    .AllowAnyOrigin() 
                    .AllowAnyMethod()
                    .AllowAnyHeader();
                });
        });
        //services.AddSingleton<InfluxDbService>();
        //services.AddHostedService<IotBind>();
        services.AddControllers().AddJsonOptions(options =>
            {
                options.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles;
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseSerilogRequestLogging();
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "Incubator v1"));
            }
      
            //app.UseHttpsRedirection();

            app.UseMiddleware<RequestResponseLoggingMiddleware>();
        
            app.UseCors("AllowAll");

            app.UseRouting()
                .UseAuthentication()
                .UseAuthorization()
                .UseEndpoints(endpoints => { endpoints.MapControllers(); });
        }
    }
