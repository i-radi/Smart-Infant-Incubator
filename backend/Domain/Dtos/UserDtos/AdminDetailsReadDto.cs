using DataAccess.Entities.Identity;
using InfraStructure.Enums;

namespace Domain.Dtos.UserDtos;

public class AdminDetailsReadDto : ReadDto<User>
{
    public Guid Id { get; set; }
    public Guid? AdminId { get; set; }
    public UserType? Type { get; set; }
    public string Name { get; set; } = null!;
    public string UserName { get; set; } = null!;
    public string Email { get; set; } = null!;
    public string PhoneNumber { get; set; } = null!;
    public string? Ssn { get; set; }
    public DateTime? BirthDate { get; set; }
    public Guid? UserImgId { get; set; }
    public string? HospitalName { get; set; } = null!;
    public string? HospitalPhone { get; set; } = null!;

}