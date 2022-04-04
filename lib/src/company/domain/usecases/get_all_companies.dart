import 'package:universidade/src/company/domain/entities/company_entity.dart';
import 'package:universidade/src/company/domain/repositories/company_repository.dart';

abstract class IGetAllCompaniesUseCase {
  Future<List<CompanyEntity>> call();
}

class GetAllCompaniesUsecase implements IGetAllCompaniesUseCase {
  final ICompanyRepository _companyRepository;

  GetAllCompaniesUsecase(this._companyRepository);

  @override
  Future<List<CompanyEntity>> call() {
    return _companyRepository.getAllCompanies();
  }
}
