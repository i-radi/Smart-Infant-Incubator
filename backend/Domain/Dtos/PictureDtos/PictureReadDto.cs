namespace Domain.Dtos.PictureDtos;

public class PictureReadDto : ReadDto<Picture>
{
    public Guid Id { get; set; }
    public string? StringValue { get; set; }

}