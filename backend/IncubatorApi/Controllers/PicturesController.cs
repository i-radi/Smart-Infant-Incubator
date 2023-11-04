using Domain.Dtos.PictureDtos;
using Microsoft.AspNetCore.Authorization;

namespace IncubatorApi.Controllers;
[Authorize(Roles = "Admin,Operator,Doctor,Nurse,Mother")]
[Route("api/[controller]")]
[ApiController]
public class PicturesController : ControllerBase
{
    private readonly IDomainRepository<Picture> _repo;
    private readonly IMapper _mapper;

    public PicturesController(IDomainRepository<Picture> repo, IMapper mapper)
    {
        _repo = repo;
        _mapper = mapper;
    }
    //GET api/Pictures
    [HttpGet]
    public ActionResult<IEnumerable<PictureReadDto>> GetAllPicture()
    {
        var modelItems = _repo.GetAllModel();

        return Ok(_mapper.Map<IEnumerable<PictureReadDto>>(modelItems));
    }

    //GET api/Pictures/{id}
    [HttpGet("{id}")]
    public ActionResult<PictureReadDto> GetPictureById(Guid id)
    {
        var modelItem = _repo.GetById(id);
        return Ok(_mapper.Map<PictureReadDto>(modelItem));
    }

    //POST api/Pictures/
    [HttpPost]
    public ActionResult<PictureReadDto> CreatePicture(PictureCreateDto createDto)
    {
        var model = _mapper.Map<Picture>(createDto);
        _repo.CreateModel(model);
        _repo.SaveChanges();

        return Ok(_mapper.Map<PictureReadDto>(model));
    }

    //PUT api/Pictures/{id}
    [HttpPut("{id}")]
    public ActionResult UpdatePicture(Guid id, PictureUpdateDto updateDto)
    {
        var modelFromRepo = _repo.GetById(id);
        _mapper.Map(updateDto, modelFromRepo);

        _repo.UpdateModel(modelFromRepo);

        _repo.SaveChanges();

        return NoContent();
    }
    /*
    //DELETE api/Pictures/{id}
    [HttpDelete("{id}")]
    public ActionResult DeletePicture(Guid id)
    {
        var modelFromRepo = _repo.GetById(id);
        _repo.DeleteModel(modelFromRepo);
        _repo.SaveChanges();

        return NoContent();
    }
    */
}