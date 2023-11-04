using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DataAccess.Migrations
{
    public partial class initial : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.EnsureSchema(
                name: "Incubator");

            migrationBuilder.EnsureSchema(
                name: "User");

            migrationBuilder.CreateTable(
                name: "Employees",
                schema: "Incubator",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    University = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    DegreeOfPromotion = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Specialization = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Employees", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Pictures",
                schema: "Incubator",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    StringValue = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreatedDateTime = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Pictures", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Roles",
                schema: "User",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    NormalizedName = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Roles", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Incubators",
                schema: "Incubator",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    IncubatorCode = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: false),
                    IsEmpty = table.Column<bool>(type: "bit", nullable: false),
                    IncubatorImgId = table.Column<Guid>(type: "uniqueidentifier", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Incubators", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Incubators_Pictures_IncubatorImgId",
                        column: x => x.IncubatorImgId,
                        principalSchema: "Incubator",
                        principalTable: "Pictures",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "Users",
                schema: "User",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    Type = table.Column<int>(type: "int", nullable: false),
                    Ssn = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    BirthDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsEmployee = table.Column<bool>(type: "bit", nullable: false),
                    EmployeeId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    HospitalName = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    HospitalPhone = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    UserImgId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    UserName = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    NormalizedUserName = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    Email = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    NormalizedEmail = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    EmailConfirmed = table.Column<bool>(type: "bit", nullable: false),
                    PasswordHash = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    SecurityStamp = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PhoneNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PhoneNumberConfirmed = table.Column<bool>(type: "bit", nullable: false),
                    TwoFactorEnabled = table.Column<bool>(type: "bit", nullable: false),
                    LockoutEnd = table.Column<DateTimeOffset>(type: "datetimeoffset", nullable: true),
                    LockoutEnabled = table.Column<bool>(type: "bit", nullable: false),
                    AccessFailedCount = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Users", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Users_Employees_EmployeeId",
                        column: x => x.EmployeeId,
                        principalSchema: "Incubator",
                        principalTable: "Employees",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Users_Pictures_UserImgId",
                        column: x => x.UserImgId,
                        principalSchema: "Incubator",
                        principalTable: "Pictures",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "RoleClaims",
                schema: "User",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RoleId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    ClaimType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ClaimValue = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_RoleClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_RoleClaims_Roles_RoleId",
                        column: x => x.RoleId,
                        principalSchema: "User",
                        principalTable: "Roles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Babies",
                schema: "Incubator",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Gender = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    BirthDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    BabyCode = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    BabyImgId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    IncubatorId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    MotherId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    DoctorId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    NurseId = table.Column<Guid>(type: "uniqueidentifier", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Babies", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Babies_Incubators_IncubatorId",
                        column: x => x.IncubatorId,
                        principalSchema: "Incubator",
                        principalTable: "Incubators",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Babies_Pictures_BabyImgId",
                        column: x => x.BabyImgId,
                        principalSchema: "Incubator",
                        principalTable: "Pictures",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Babies_Users_DoctorId",
                        column: x => x.DoctorId,
                        principalSchema: "User",
                        principalTable: "Users",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Babies_Users_MotherId",
                        column: x => x.MotherId,
                        principalSchema: "User",
                        principalTable: "Users",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Babies_Users_NurseId",
                        column: x => x.NurseId,
                        principalSchema: "User",
                        principalTable: "Users",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "UserClaims",
                schema: "User",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    ClaimType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ClaimValue = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_UserClaims_Users_UserId",
                        column: x => x.UserId,
                        principalSchema: "User",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "UserLogins",
                schema: "User",
                columns: table => new
                {
                    LoginProvider = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ProviderKey = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ProviderDisplayName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UserId = table.Column<Guid>(type: "uniqueidentifier", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserLogins", x => new { x.LoginProvider, x.ProviderKey });
                    table.ForeignKey(
                        name: "FK_UserLogins_Users_UserId",
                        column: x => x.UserId,
                        principalSchema: "User",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "UserRoles",
                schema: "User",
                columns: table => new
                {
                    UserId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    RoleId = table.Column<Guid>(type: "uniqueidentifier", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserRoles", x => new { x.UserId, x.RoleId });
                    table.ForeignKey(
                        name: "FK_UserRoles_Roles_RoleId",
                        column: x => x.RoleId,
                        principalSchema: "User",
                        principalTable: "Roles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_UserRoles_Users_UserId",
                        column: x => x.UserId,
                        principalSchema: "User",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "UserTokens",
                schema: "User",
                columns: table => new
                {
                    UserId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    LoginProvider = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Value = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserTokens", x => new { x.UserId, x.LoginProvider, x.Name });
                    table.ForeignKey(
                        name: "FK_UserTokens_Users_UserId",
                        column: x => x.UserId,
                        principalSchema: "User",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Babies_BabyImgId",
                schema: "Incubator",
                table: "Babies",
                column: "BabyImgId",
                unique: true,
                filter: "[BabyImgId] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_Babies_DoctorId",
                schema: "Incubator",
                table: "Babies",
                column: "DoctorId");

            migrationBuilder.CreateIndex(
                name: "IX_Babies_IncubatorId",
                schema: "Incubator",
                table: "Babies",
                column: "IncubatorId");

            migrationBuilder.CreateIndex(
                name: "IX_Babies_MotherId",
                schema: "Incubator",
                table: "Babies",
                column: "MotherId");

            migrationBuilder.CreateIndex(
                name: "IX_Babies_NurseId",
                schema: "Incubator",
                table: "Babies",
                column: "NurseId");

            migrationBuilder.CreateIndex(
                name: "IX_Incubators_IncubatorImgId",
                schema: "Incubator",
                table: "Incubators",
                column: "IncubatorImgId",
                unique: true,
                filter: "[IncubatorImgId] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_RoleClaims_RoleId",
                schema: "User",
                table: "RoleClaims",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "RoleNameIndex",
                schema: "User",
                table: "Roles",
                column: "NormalizedName",
                unique: true,
                filter: "[NormalizedName] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_UserClaims_UserId",
                schema: "User",
                table: "UserClaims",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_UserLogins_UserId",
                schema: "User",
                table: "UserLogins",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_UserRoles_RoleId",
                schema: "User",
                table: "UserRoles",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "EmailIndex",
                schema: "User",
                table: "Users",
                column: "NormalizedEmail");

            migrationBuilder.CreateIndex(
                name: "IX_Users_EmployeeId",
                schema: "User",
                table: "Users",
                column: "EmployeeId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Users_UserImgId",
                schema: "User",
                table: "Users",
                column: "UserImgId",
                unique: true,
                filter: "[UserImgId] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "UserNameIndex",
                schema: "User",
                table: "Users",
                column: "NormalizedUserName",
                unique: true,
                filter: "[NormalizedUserName] IS NOT NULL");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Babies",
                schema: "Incubator");

            migrationBuilder.DropTable(
                name: "RoleClaims",
                schema: "User");

            migrationBuilder.DropTable(
                name: "UserClaims",
                schema: "User");

            migrationBuilder.DropTable(
                name: "UserLogins",
                schema: "User");

            migrationBuilder.DropTable(
                name: "UserRoles",
                schema: "User");

            migrationBuilder.DropTable(
                name: "UserTokens",
                schema: "User");

            migrationBuilder.DropTable(
                name: "Incubators",
                schema: "Incubator");

            migrationBuilder.DropTable(
                name: "Roles",
                schema: "User");

            migrationBuilder.DropTable(
                name: "Users",
                schema: "User");

            migrationBuilder.DropTable(
                name: "Employees",
                schema: "Incubator");

            migrationBuilder.DropTable(
                name: "Pictures",
                schema: "Incubator");
        }
    }
}
