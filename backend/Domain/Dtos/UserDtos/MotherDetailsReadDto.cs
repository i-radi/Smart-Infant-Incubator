using DataAccess.Entities.Identity;
using InfraStructure.Enums;

namespace Domain.Dtos.UserDtos;

public class MotherDetailsReadDto : ReadDto<User>
{
    public Guid Id { get; set; }
    public Guid AdminId { get; set; }
    public UserType? Type { get; set; }
    public string Name { get; set; } = null!;
    public string UserName { get; set; } = null!;
    public string Email { get; set; } = null!;
    public string PhoneNumber { get; set; } = null!;
    public Guid? UserImgId { get; set; }
    public IEnumerable<string>? BabyCodes { get; set; }
    public IEnumerable<Guid>? BabiesId { get; set; }
    public IEnumerable<Guid>? DoctorsId { get; set; }
    public IEnumerable<Guid>? NursesId { get; set; }

}