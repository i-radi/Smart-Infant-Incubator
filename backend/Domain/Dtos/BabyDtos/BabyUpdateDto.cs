namespace Domain.Dtos.BabyDtos;

public class BabyUpdateDto : UpdateDto<Baby>
{

    public string Gender { get; set; } = null!;
    public DateTime BirthDate { get; set; }
    public string BabyCode { get; set; } = null!;
    public Guid IncubatorId { get; set; }
    public Guid? BabyImgId { get; set; }
    public Guid? MotherId { get; set; }
    public Guid? DoctorId { get; set; }
    public Guid? NurseId { get; set; }

}