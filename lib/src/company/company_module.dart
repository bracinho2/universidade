import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:universidade/src/company/domain/repositories/company_repository.dart';
import 'package:universidade/src/company/domain/usecases/get_all_companies.dart';
import 'package:universidade/src/company/external/api/api_datasource_impl.dart';
import 'package:universidade/src/company/infra/datasource/company_datasource.dart';
import 'package:universidade/src/company/infra/repositories/company_repository_impl.dart';
import 'package:universidade/src/company/presenter/company_store.dart';
import 'package:universidade/src/company/service/remote_service_impl.dart';
import 'package:universidade/src/company/service/remote_service_interface.dart';

class CompanyDI {
  static void inject(GetIt di) {
    //empresas homepage
    di.registerFactory(() => Dio());
    di.registerFactory<IRemoteStorageService>(
        () => RemoteServiceImpl(di.get()));
    di.registerFactory<ICompanyDatasource>(() => DatasourceImpl(di.get()));
    di.registerFactory<ICompanyRepository>(
        () => CompanyRepositoryImpl(di.get()));
    di.registerFactory<IGetAllCompaniesUseCase>(
        () => GetAllCompaniesUsecase(di.get()));
    di.registerFactory(() => CompanyController(di.get()));
  }
}
