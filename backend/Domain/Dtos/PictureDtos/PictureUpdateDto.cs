namespace Domain.Dtos.PictureDtos;

public class PictureUpdateDto : UpdateDto<Picture>
{

    public Guid Id { get; set; }
    public string? StringValue { get; set; }

}