import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:universidade/src/company/domain/entities/company_entity.dart';
import 'package:universidade/src/company/domain/repositories/company_repository.dart';
import 'package:universidade/src/company/domain/usecases/get_all_companies.dart';

class CompanyRepositoryMock extends Mock implements ICompanyRepository {}

class CompanyEntityMock extends Mock implements CompanyEntity {}

void main() {
  test('Deve retornar uma lista de Empresas...', () async {
    final repository = CompanyRepositoryMock();
    final entity = CompanyEntityMock();

    when(() => repository.getAllCompanies())
        .thenAnswer((_) => Future.value([entity, entity]));

    final usecase = GetAllCompaniesUsecase(repository);

    final result = await usecase.call();

    //var value = await Future.value(10);
    expect(result, equals([entity, entity]));
  });
}
