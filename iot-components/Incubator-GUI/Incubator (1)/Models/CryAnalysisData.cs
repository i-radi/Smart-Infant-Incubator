using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace Incubator.Models
{
    public class CryAnalysisData
    {
        public double hungry { get; set; }
        public double belly_pain { get; set; }
        public double burping { get; set; }
        public double discomfort { get; set; }
        public double tired { get; set; }

        public override string ToString()
        {
            return $"hungry = {hungry},belly_pain={belly_pain},burping={burping},discomfort={discomfort},tired={tired}";
        }

       
    }
}