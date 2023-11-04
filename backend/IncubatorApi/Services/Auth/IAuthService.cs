using Domain.Dtos.IdentityDtos;
using Domain.Dtos.Jwt;

namespace IncubatorApi.Services.Auth
{
    public interface IAuthService
    {
        Task<AuthDto> ChangePasswordAsync(ChangePasswordDto dto);
        Task<AuthDto> RegisterAsync(RegisterDto dto);
        Task<AuthDto> GetTokenAsync(TokenRequestDto dto);
        Task<string> AddRoleAsync(AddRoleDto dto);
    }
}