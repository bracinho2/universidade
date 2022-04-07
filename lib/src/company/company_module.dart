import 'package:provider/provider.dart';
import 'package:universidade/shared/service/remote_service_impl.dart';
import 'package:universidade/shared/service/remote_service_interface.dart';

import 'package:universidade/src/company/domain/repositories/company_repository.dart';
import 'package:universidade/src/company/domain/usecases/get_all_companies.dart';
import 'package:universidade/src/company/external/api/api_datasource_impl.dart';
import 'package:universidade/src/company/infra/datasource/company_datasource.dart';
import 'package:universidade/src/company/infra/repositories/company_repository_impl.dart';
import 'package:universidade/src/company/presenter/company_store.dart';

final companyModule = [
  Provider<IRemoteStorageServiceAPI>(
      create: (context) => RemoteServiceImpl(context.read())),
  Provider<ICompanyDatasource>(
      create: (context) => CompanyDatasourceImpl(context.read())),
  Provider<ICompanyRepository>(
      create: (context) => CompanyRepositoryImpl(context.read())),
  Provider<IGetAllCompaniesUseCase>(
      create: (context) => GetAllCompaniesUsecase(context.read())),
  Provider<IGetAllCompaniesUseCase>(
      create: (context) => GetAllCompaniesUsecase(context.read())),
  ChangeNotifierProvider(
      create: (context) => CompanyController(context.read())),
];
