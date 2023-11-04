using DataAccess.Entities.Identity;
using InfraStructure.Enums;

namespace Domain.Dtos.UserDtos;

public class UserReadDto : ReadDto<User>
{
    public Guid Id { get; set; }
    public UserType? Type { get; set; }
    public string UserName { get; set; } = null!;
    public string Name { get; set; } = null!;
    public string Email { get; set; } = null!;
    public string PhoneNumber { get; set; } = null!;
    public Guid? UserImgId { get; set; }
}