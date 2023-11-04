using Domain.Dtos.BabyDtos;
using Domain.Dtos.UserDtos;

namespace Domain.Dtos.IncubatorDtos
{
    public class IncubatorCreateDto : CreateDto<Incubator>
    {
        public string IncubatorCode { get; set; } = null!;
        public bool IsEmpty { get; set; }
        public Guid? IncubatorImgId { get; set; }
    }
}