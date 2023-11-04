using System;
using System.IO;
using System.Net.Mime;
using System.Text.RegularExpressions;

namespace InfraStructure.Helpers;

/// <summary>
/// Container For Base64 Images
/// </summary>
public class Base64Image
{
    /// <summary>
    /// Image UserType Ex:(Jpg,Png)
    /// </summary>
    public string ImageType { get; }

    /// <summary>
    /// Base64 String Data only without any Base64 Header(Descriptor)
    /// </summary>
    public string ImageData { get; }

    /// <summary>
    /// Mime UserType is Image UserType In Mime Format Ex:(Image/PNG)
    /// </summary>
    public string MimeType => "Image/" + ImageType;

    /// <summary>
    /// Base64 Header(Descriptor) Ex:(Image/PNG;base64)
    /// </summary>
    public string FullType => MimeType + ";base64";

    /// <summary>
    /// Mime UserType in Content UserType Class
    /// </summary>
    public ContentType ContentType => new ContentType(MimeType);

    /// <summary>
    /// Construct a Container to Image with Base64 string Format
    /// </summary>
    /// <param name="imageString">Full String of Image</param>
    public Base64Image(string imageString)
    {
        var matches= Regex.Match(imageString, @"data:[iI]mage/(?<type>.+?);[Bb]ase64,(?<data>.+)");
        ImageType = matches.Groups["type"].Value;
        ImageData = matches.Groups["data"].Value;
        if (string.IsNullOrEmpty(ImageType) || string.IsNullOrEmpty(ImageData))
            throw  new ArgumentException("Image Base64 not in correct format");
    }

    /// <summary>
    /// Construct a Container to Image with Base64 string Format
    /// </summary>
    /// <param name="imageData">Base64 string Without Base64 Header(Descriptor) </param>
    /// <param name="imageType">Image UserType Ex:(Jpg,Png)</param>
    public Base64Image(string imageData,string imageType)
    {
        ImageType = imageType;
        ImageData = imageData;
        if (string.IsNullOrEmpty(ImageType) || string.IsNullOrEmpty(ImageData))
            throw new ArgumentException("Image Base64 not in correct format");
    }

    /// <summary>
    /// Convert Image to Memory Stream
    /// </summary>
    /// <returns></returns>
    public MemoryStream ToMemoryStream() =>new MemoryStream(Convert.FromBase64String(ImageData));

    /// <summary>
    /// String Contains Base64 Data with Header
    /// </summary>
    /// <returns></returns>
    public override string ToString() => $"data:{FullType},{ImageData}";
}