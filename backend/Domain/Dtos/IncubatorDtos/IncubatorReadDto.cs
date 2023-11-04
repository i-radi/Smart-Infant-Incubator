using Domain.Dtos.BabyDtos;

namespace Domain.Dtos.IncubatorDtos;

public class IncubatorReadDto : ReadDto<Incubator>
{
    public Guid Id { get; set; }
    public string IncubatorCode { get; set; } = null!;
    public bool IsEmpty { get; set; }
    public Guid? IncubatorImgId { get; set; }
    public BabyReadDto Baby { get; set; } = null!;
}
