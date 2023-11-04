using Domain.Dtos.UserDtos;

namespace Domain.Dtos.BabyDtos;

public class BabyReadDto : ReadDto<Baby>
{
    public Guid Id { get; set; }
    public string Gender { get; set; } = null!;
    public DateTime BirthDate { get; set; }
    public string BabyCode { get; set; } = null!;
    public Guid IncubatorId { get; set; }
    public Guid? BabyImgId { get; set; }
    public MotherDetailsReadDto? mother  { get; set; }
    public string? DoctorName { get; set; }
    public string? NurseName { get; set; }

}