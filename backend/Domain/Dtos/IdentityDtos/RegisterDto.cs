using Domain.Dtos.EmployeeDtos;
using InfraStructure.Enums;

namespace Domain.Dtos.IdentityDtos
{
    public class RegisterDto : IDto
    {
        public RegisterDto(Guid? userImgId,
            string name,
            string username,
            string email,
            string password,
            UserType type,
            string ssn,
            DateTime? birthDate,
            bool isEmployee,
            string? phoneNumber,
            string? hospitalName,
            string? hospitalPhone,
            string? university,
            string? degreeOfPromotion,
            string? specialization
            )
        {
            UserImgId = userImgId;
            Name = name;
            Username = username;
            Email = email;
            Password = password;
            Type = type;
            Ssn = ssn;
            BirthDate = birthDate;
            IsEmployee = isEmployee;
            PhoneNumber = phoneNumber;
            HospitalName =hospitalName ;
            HospitalPhone=hospitalPhone ;
            University = university ;
            Specialization = specialization;
            DegreeOfPromotion = degreeOfPromotion;
        }
        public Guid? UserImgId { get; set; }

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
        public string? Specialization { get; set; } = null!;
        public string? University { get; set; } = null!;
        public string? DegreeOfPromotion { get; set; } = null!;
    }
}