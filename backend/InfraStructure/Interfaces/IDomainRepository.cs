using System;
using System.Collections.Generic;

namespace InfraStructure.Interfaces;

public interface IDomainRepository: IDisposable
{
    
}

public interface IDomainRepository<TModel>: IDomainRepository 
    where TModel : class
{
    bool SaveChanges();

    IEnumerable<TModel> GetAllModel();
    TModel GetById(Guid id);
    void CreateModel(TModel model);
    void UpdateModel(TModel model);
    void DeleteModel(TModel model);
}