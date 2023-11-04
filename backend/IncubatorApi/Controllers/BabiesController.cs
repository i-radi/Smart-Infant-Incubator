using Domain.Dtos.BabyDtos;
using Microsoft.AspNetCore.Authorization;

namespace IncubatorApi.Controllers;
//[Authorize(Roles = "Admin,Operator,Doctor,Nurse,Mother")]
[Route("api/[controller]")]
[ApiController]
public class BabiesController : ControllerBase
{
    private readonly IDomainRepository<Baby> _repo;
    private readonly IMapper _mapper;

    public BabiesController(IDomainRepository<Baby> repo, IMapper mapper)
    {
        _repo = repo;
        _mapper = mapper;
    }
    //GET api/Babies
    [Authorize(Roles = "Doctor,Nurse,Mother")]
    [HttpGet]
    public ActionResult<IEnumerable<BabyReadDto>> GetAllBaby()
    {
        var modelItems = _repo.GetAllModel();

        return Ok(_mapper.Map<IEnumerable<BabyReadDto>>(modelItems));
    }

    //GET api/Babies/{id}
    [Authorize(Roles = "Doctor,Nurse,Mother")]
    [HttpGet("{id}")]
    public ActionResult<BabyReadDto> GetBabyById(Guid id)
    {
        var modelItem = _repo.GetById(id);
        return Ok(_mapper.Map<BabyReadDto>(modelItem));
    }

    //POST api/Babies/
    [Authorize(Roles = "Admin,Operator")]
    [HttpPost]
    public ActionResult<BabyReadDto> CreateBaby(BabyCreateDto createDto)
    {
        var model = _mapper.Map<Baby>(createDto);
        _repo.CreateModel(model);
        _repo.SaveChanges();

        return Ok(_mapper.Map<BabyReadDto>(model));
    }

    //PUT api/Babies/{id}
    [Authorize(Roles = "Admin,Operator")]
    [HttpPut("{id}")]
    public ActionResult UpdateBaby(Guid id, BabyUpdateDto updateDto)
    {
        var modelFromRepo = _repo.GetById(id);
        _mapper.Map(updateDto, modelFromRepo);

        _repo.UpdateModel(modelFromRepo);

        _repo.SaveChanges();

        return NoContent();
    }

    //DELETE api/Babies/{id}
    [Authorize(Roles = "Admin,Operator")]
    [HttpDelete("{id}")]
    public ActionResult DeleteBaby(Guid id)
    {
        var modelFromRepo = _repo.GetById(id);
        _repo.DeleteModel(modelFromRepo);
        _repo.SaveChanges();

        return NoContent();
    }
}