import 'package:universidade/src/company/domain/entities/company_entity.dart';

abstract class ICompanyRepository {
  Future<List<CompanyEntity>> getAllCompanies();
}
