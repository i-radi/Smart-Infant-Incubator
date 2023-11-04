using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Incubator.Models
{
    /*public class BabyData
    {
        public string babyCode { get; set; } = null!;
        public string gender { get; set; } = null!;
        public string doctorId { get; set; } = null!;
        public string nurseId { get; set; } = null!;
        public string motherId { get; set; } = null!;
        public string birthDate { get; set; } = null!;

        public override string ToString()
        {
            return $"babyCode = {babyCode},gender={gender},doctorId={doctorId},nurseId={nurseId},motherId={motherId},birthDate={birthDate}";
        }
    */}


    public class BabyData
    {
        public Guid Id { get; set; }
        public string Gender { get; set; } = null!;
        public DateTime BirthDate { get; set; }
        public string BabyCode { get; set; } = null!;
        public Guid IncubatorId { get; set; }
        public Guid? BabyImgId { get; set; }
        //public MotherDetailsReadDto? mother { get; set; }
        public string? DoctorName { get; set; }
        public string? NurseName { get; set; }

        public override string ToString()
        {
            return $"Id = {Id},Gender={Gender},BirthDate={BirthDate},BabyCode={BabyCode}" +
                $",IncubatorId={IncubatorId},BabyImgId={BabyImgId},DoctorName={DoctorName}" +
                $",NurseName={NurseName}";
        }

    }


