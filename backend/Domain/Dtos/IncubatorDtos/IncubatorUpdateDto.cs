using Domain.Dtos.BabyDtos;
using Domain.Dtos.UserDtos;

namespace Domain.Dtos.IncubatorDtos
{
    public class IncubatorUpdateDto : UpdateDto<Incubator>
    {
        public Guid Id { get; set; }
        public string IncubatorCode { get; set; } = null!;
        public bool IsEmpty { get; set; }
        public Guid? IncubatorImgId { get; set; }
    }
}