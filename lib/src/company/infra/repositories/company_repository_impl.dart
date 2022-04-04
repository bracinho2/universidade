import 'package:universidade/src/company/domain/entities/company_entity.dart';
import 'package:universidade/src/company/domain/repositories/company_repository.dart';
import 'package:universidade/src/company/infra/datasource/company_datasource.dart';
import 'package:universidade/src/company/infra/mappers/company_mapper.dart';

class CompanyRepositoryImpl implements ICompanyRepository {
  final ICompanyDatasource _companyDataSource;

  CompanyRepositoryImpl(this._companyDataSource);

  @override
  Future<List<CompanyEntity>> getAllCompanies() async {
    final response = await _companyDataSource.getAllCompanies();

    final List<CompanyEntity> listCompany = [];

    for (var element in response) {
      final company = CompanyMapper.fromMap(element);
      listCompany.add(company);
    }

    return listCompany;
  }
}
