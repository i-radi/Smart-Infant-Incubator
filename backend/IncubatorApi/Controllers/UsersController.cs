using DataAccess.Entities.Identity;
using Domain.Dtos.IdentityDtos;
using Domain.Dtos.Jwt;
using Domain.Dtos.UserDtos;
using IncubatorApi.Services.Auth;
using InfraStructure.Enums;
using Microsoft.AspNetCore.Authorization;
using Microsoft.EntityFrameworkCore;

namespace IncubatorApi.Controllers;
[Route("api/[controller]")]
[ApiController]
public class UsersController : ControllerBase
{
    private readonly IMapper _mapper;

    private readonly IAuthService _authService;

    private readonly IDomainRepository<User> _repo;

    private readonly UserManager<User> _userManager;

    public UsersController(UserManager<User> userManager, 
        IAuthService authService,
        IDomainRepository<User> repo,
        IMapper mapper)
    {
        _userManager = userManager;
        _authService = authService;
        _repo = repo;
        _mapper = mapper;
    }

    [Authorize(Roles = "Admin,Operator")]
    [HttpPost("register")]
    public async Task<IActionResult> RegisterAsync(RegisterDto dto)
    {
        if (!ModelState.IsValid)
            return BadRequest(ModelState);

        var result = await _authService.RegisterAsync(dto);

        if (!result.IsAuthenticated)
            return BadRequest(result.Message);

        return Ok(result);
    }

    [HttpPost("login")]//token  
    public async Task<IActionResult> GetTokenAsync([FromBody] TokenRequestDto model)
    {
        if (!ModelState.IsValid)
            return BadRequest(ModelState);

        var result = await _authService.GetTokenAsync(model);

        if (!result.IsAuthenticated)
            return BadRequest(result.Message);

        return Ok(result);
    }

    //GET api/Users
    //[Authorize(Roles = "Admin,Operator,Doctor,Nurse,Mother")]
    [HttpGet]
    public ActionResult<IEnumerable<UserReadDto>> GetAll(UserType type = UserType.None)
    {
        IEnumerable<User> modelItems = null;
        if (type == UserType.None)
            modelItems = _repo.GetAllModel();
        else
            modelItems = _repo.GetAllModel().Where(x => x.Type == type);

        return Ok(_mapper.Map<IEnumerable<UserReadDto>>(modelItems));
    }

    //GET api/Users/{id}
    [Authorize(Roles = "Admin,Operator,Doctor,Nurse,Mother")]
    [HttpGet("id")]
    public ActionResult<UserReadDto> GetSimpleUserById(Guid id)
    {
        var modelItem = _repo.GetById(id);
        return Ok(_mapper.Map<UserReadDto>(modelItem));
    }

    //GET api/Users/{id}
    [Authorize(Roles = "Admin,Operator,Doctor,Nurse,Mother")]
    [HttpGet("adminId")]
    public ActionResult<AdminDetailsReadDto> GetAdminById(Guid adminId)
    {
        var info = _mapper.Map<AdminDetailsReadDto>(_repo.GetById(adminId));
        info.AdminId = _repo.GetAllModel().Where(x => x.Type == UserType.Admin).FirstOrDefault().Id; ;
        return Ok(info);
    }

    //GET api/Users/{id}
    [Authorize(Roles = "Admin,Operator,Doctor,Nurse,Mother")]
    [HttpGet("doctorId")]
    public ActionResult<DoctorDetailsReadDto> GetDoctorById(Guid doctorId)
    {
        var info = _mapper.Map<DoctorDetailsReadDto>(_repo.GetById(doctorId));
        info.AdminId = _repo.GetAllModel().Where(x => x.Type == UserType.Admin).FirstOrDefault().Id; ;
        return Ok(info);
    }

    //GET api/Users/{id}
    [Authorize(Roles = "Admin,Operator,Doctor,Nurse,Mother")]
    [HttpGet("nurseId")]
    public ActionResult<NurseDetailsReadDto> GetNurseById(Guid nurseId)
    {
        var info = _mapper.Map<NurseDetailsReadDto>(_repo.GetById(nurseId));
        info.AdminId = _repo.GetAllModel().Where(x => x.Type == UserType.Admin).FirstOrDefault().Id; ;
        return Ok(info);
    }

    //GET api/Users/{id}
    [Authorize(Roles = "Admin,Operator,Doctor,Nurse,Mother")]
    [HttpGet("motherId")]
    public ActionResult<MotherDetailsReadDto> GetMotherById(Guid motherId)
    {
        var info = _mapper.Map<MotherDetailsReadDto>(_repo.GetById(motherId));
        info.AdminId = _repo.GetAllModel().Where(x => x.Type == UserType.Admin).FirstOrDefault().Id; ;
        return Ok(info);
    }

    //PUT api/Users/{id}
    [Authorize(Roles = "Admin,Operator,Doctor,Nurse")]
    [HttpPut()]
    public async Task<ActionResult> UpdateAsync( Guid userId, UserUpdateDto updateDto)
    {
        var user = await _userManager.Users
            .Include(x => x.UserPicture)
            .SingleOrDefaultAsync(x =>  x.Id == userId);
        _mapper.Map(updateDto, user);
        _repo.UpdateModel(user!);

        _repo.SaveChanges();

        return NoContent();
    }


    [Authorize(Roles = "Admin,Operator,Doctor,Nurse,Mother")]
    [HttpPost("changePassword")]
    public async Task<IActionResult> ChangePasswordAsync([FromBody] ChangePasswordDto dto)
    {
        if (!ModelState.IsValid)
            return BadRequest(ModelState);

        var result = await _authService.ChangePasswordAsync(dto);

        if (!result.IsAuthenticated)
            return BadRequest(result.Message);

        return Ok(result);
    }
    //DELETE api/Users/{id}
    [Authorize(Roles = "Admin,Operator")]
    [HttpDelete("{id}")]
    public ActionResult DeleteUser(Guid id)
    {
        var modelFromRepo = _repo.GetById(id);
        _repo.DeleteModel(modelFromRepo);
        _repo.SaveChanges();

        return NoContent();
    }
}