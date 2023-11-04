using AutoMapper;
using Domain.Dtos.BabyDtos;
using Domain.Dtos.UserDtos;
using Domain.Dtos.PictureDtos;
using Domain.Dtos.EmployeeDtos;
using Domain.Dtos.IdentityDtos;
using Domain.Dtos.IncubatorDtos;
using DataAccess.Entities.Identity;

namespace Domain.Profiles;
public class IncubatorsProfile : Profile,IMapperProfile
{
    public IncubatorsProfile()
    {
        //Source -> Target
        CreateMap<RegisterDto, User>()
            .ForMember(dst => dst.Employee, opt => opt.MapFrom(i => new Employee {
                Specialization = i.Specialization!,
                DegreeOfPromotion=i.DegreeOfPromotion!,
                University=i.University!}));
        
        CreateMap<EmployeeCreateDto, User>();
        CreateMap<ChangePasswordDto, User>();

        CreateMap<User, AdminDetailsReadDto>();

        CreateMap<User, DoctorDetailsReadDto>()
                .ForMember(dst => dst.DegreeOfPromotion, opt => opt.MapFrom(src => src.Employee!.DegreeOfPromotion))
                .ForMember(dst => dst.Specialization, opt => opt.MapFrom(src => src.Employee!.Specialization))
                .ForMember(dst => dst.University, opt => opt.MapFrom(src => src.Employee!.University))
                .ForMember(dst => dst.BabyCodes, opt => opt.MapFrom(src => src.DoctorBabies!.Select(b => b.BabyCode)))
                .ForMember(dst => dst.IncubatorsId, opt => opt.MapFrom(src => src.DoctorBabies!.Select(b => b.IncubatorId)))
                .ForMember(dst => dst.NursesId, opt => opt.MapFrom(src => src.DoctorBabies!.Select(b => b.NurseId)));
        
        CreateMap<User, NurseDetailsReadDto>()
                .ForMember(dst => dst.DegreeOfPromotion, opt => opt.MapFrom(src => src.Employee!.DegreeOfPromotion))
                .ForMember(dst => dst.Specialization, opt => opt.MapFrom(src => src.Employee!.Specialization))
                .ForMember(dst => dst.University, opt => opt.MapFrom(src => src.Employee!.University))
                .ForMember(dst => dst.BabyCodes, opt => opt.MapFrom(src => src.NurseBabies!.Select(b => b.BabyCode)))
                .ForMember(dst => dst.IncubatorsId, opt => opt.MapFrom(src => src.NurseBabies!.Select(b => b.IncubatorId)))
                .ForMember(dst => dst.DoctorsId, opt => opt.MapFrom(src => src.NurseBabies!.Select(b => b.DoctorId)));
        
        CreateMap<User, MotherDetailsReadDto>()
                .ForMember(dst => dst.BabyCodes, opt => opt.MapFrom(src => src.MotherBabies!.Select(b => b.BabyCode)))
                .ForMember(dst => dst.BabiesId, opt => opt.MapFrom(src => src.MotherBabies!.Select(b => b.Id)))
                .ForMember(dst => dst.DoctorsId, opt => opt.MapFrom(src => src.MotherBabies!.Select(b => b.DoctorId)))
                .ForMember(dst => dst.NursesId, opt => opt.MapFrom(src => src.MotherBabies!.Select(b => b.NurseId)));

        CreateMap<User, UserReadDto>();
        CreateMap<UserUpdateDto, User>()
            .ForMember(dst => dst.Employee, opt => opt.MapFrom(i => new Employee
            {
                Specialization = i.Specialization!,
                DegreeOfPromotion = i.DegreeOfPromotion!,
                University = i.University!
            }));


        CreateMap<Employee, EmployeeReadDto>();
        CreateMap<EmployeeCreateDto, Employee>();
        CreateMap<EmployeeUpdateDto, Employee>();

        CreateMap<Incubator, IncubatorReadDto>()
                .ForMember(dst => dst.Baby, opt => opt.MapFrom(src => src.Babies!.FirstOrDefault(b => b.IsDeleted == false)));

        CreateMap<IncubatorCreateDto, Incubator>();
        CreateMap<IncubatorUpdateDto, Incubator>();

        CreateMap<Baby, BabyReadDto>()
            .ForMember(dst => dst.DoctorName, opt => opt.MapFrom(src => src.Doctor!.UserName))
                .ForMember(dst => dst.NurseName, opt => opt.MapFrom(src => src.Nurse!.UserName));
        CreateMap<BabyCreateDto, Baby>();
        CreateMap<BabyUpdateDto, Baby>();

        CreateMap<Picture, PictureReadDto>();
        CreateMap<PictureCreateDto, Picture>();
        CreateMap<PictureUpdateDto, Picture>();


        // .ForMember(dst => dst., opt => opt.AllowNull())
        // .ForMember(dst => dst., opt => opt.Ignore());
        // .PreserveReferences();
        // .ReverseMap();
        // .MaxDepth(2);
    }
}
