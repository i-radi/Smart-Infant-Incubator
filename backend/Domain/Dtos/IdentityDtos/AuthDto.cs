using InfraStructure.Enums;

namespace Domain.Dtos.IdentityDtos
{
    public class AuthDto : IDto
    {
        public string Message { get; set; } = null!;
        public bool IsAuthenticated { get; set; }
        public string Username { get; set; } = null!;
        public string Email { get; set; } = null!;
        public UserType? Role { get; set; } = null!;
        //public string Role { get; set; } = null!;
        public string Token { get; set; } = null!;
        //public DateTime ExpiresOn { get; set; }
    }
}