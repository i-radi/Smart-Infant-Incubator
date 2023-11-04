namespace Domain.Dtos.EmployeeDtos;

public class EmployeeCreateDto : CreateDto<Employee>
{
    public string? University { get; set; }
    public string? DegreeOfPromotion { get; set; }
    public string? Specialization { get; set; }
}