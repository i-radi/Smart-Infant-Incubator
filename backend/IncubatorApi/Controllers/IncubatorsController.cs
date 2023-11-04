using Domain.Dtos.IncubatorDtos;
using Microsoft.AspNetCore.Authorization;

namespace IncubatorApi.Controllers;
[Authorize(Roles = "Admin,Operator")]
[Route("api/[controller]")]
[ApiController]
public class IncubatorsController: ControllerBase
{
    private readonly IDomainRepository<Incubator> _repo;
    private readonly IMapper _mapper;

    public IncubatorsController(IDomainRepository<Incubator> repo, IMapper mapper)
    {
        _repo = repo;
        _mapper = mapper;
    }
    //GET api/Incubators
    [HttpGet]
    public ActionResult<IEnumerable<IncubatorReadDto>> GetAllIncubator()
    {
        var modelItems = _repo.GetAllModel();

        return Ok(_mapper.Map<IEnumerable<IncubatorReadDto>>(modelItems));
    }

    //GET api/Incubators/{id}
    [HttpGet("{id}")]
    public ActionResult<IncubatorReadDto> GetIncubatorById(Guid id)
    {
        var modelItem = _repo.GetById(id);
        return Ok(_mapper.Map<IncubatorReadDto>(modelItem));
    }

    //POST api/Incubators/
    [HttpPost]
    public ActionResult<IncubatorReadDto> CreateIncubator(IncubatorCreateDto createDto)
    {
        var model = _mapper.Map<Incubator>(createDto);
        _repo.CreateModel(model);
        _repo.SaveChanges();

        return Ok(_mapper.Map<IncubatorReadDto>(model));
    }

    //PUT api/Incubators/{id}
    [HttpPut("{id}")]
    public ActionResult UpdateIncubator(Guid id, IncubatorUpdateDto updateDto)
    {
        var modelFromRepo = _repo.GetById(id);
        _mapper.Map(updateDto, modelFromRepo);

        _repo.UpdateModel(modelFromRepo);

        _repo.SaveChanges();

        return NoContent();
    }
    /*
    //DELETE api/Incubators/{id}
    [HttpDelete("{id}")]
    public ActionResult DeleteIncubator(Guid id)
    {
        var modelFromRepo = _repo.GetById(id);
        _repo.DeleteModel(modelFromRepo);
        _repo.SaveChanges();

        return NoContent();
    }
    */
}