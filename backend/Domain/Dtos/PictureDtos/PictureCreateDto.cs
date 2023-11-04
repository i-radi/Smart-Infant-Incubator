namespace Domain.Dtos.PictureDtos;

public class PictureCreateDto : CreateDto<Picture>
{
    public string? StringValue { get; set; }

}