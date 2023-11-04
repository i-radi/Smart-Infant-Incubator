using DataAccess.Entities.Identity;
using Domain.Dtos.EmployeeDtos;
using InfraStructure.Enums;

namespace Domain.Dtos.UserDtos;

public class UserUpdateDto : UpdateDto<User>
{
    public UserUpdateDto(string name,
            string username,
            string email,
            string password,
            UserType type,
            string ssn,
            DateTime? birthDate,
            bool isEmployee,
            string phoneNumber,
            string? hospitalName,
            string? hospitalPhone,
            string? university,
            string? degreeOfPromotion,
            string? specialization,
            Guid? userImgId
            )
    {
        Name = name;
        Username = username;
        Email = email;
        Password = password;
        Type = type;
        Ssn = ssn;
        BirthDate = birthDate;
        IsEmployee = isEmployee;
        PhoneNumber = phoneNumber;
        HospitalName = hospitalName;
        HospitalPhone = hospitalPhone;
        University = university;
        DegreeOfPromotion = degreeOfPromotion;
        Specialization = specialization;
        UserImgId = userImgId;
    }

    [Required, StringLength(100)]
    public string Name { get; }

    [Required, StringLength(50)]
    public string Username { get; }

    [Required, StringLength(128)]
    public string Email { get; }

    [Required, StringLength(50)]
    public string Password { get; }
    public string? PhoneNumber { get; }
    public UserType Type { get; set; }
    public string? Ssn { get; set; }
    public DateTime? BirthDate { get; set; }
    public bool IsEmployee { get; set; }
    public string? HospitalName { get; set; } = null!;
    public string? HospitalPhone { get; set; } = null!;
    public Guid? UserImgId { get; set; }
    public string? University { get; set; } = null!;
    public string? DegreeOfPromotion { get; set; } = null!;
    public string? Specialization { get; set; } = null!;

}