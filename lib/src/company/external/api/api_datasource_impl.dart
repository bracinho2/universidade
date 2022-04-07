import 'package:universidade/core/api_router.dart';
import 'package:universidade/shared/service/remote_service_interface.dart';
import 'package:universidade/src/company/infra/datasource/company_datasource.dart';

class CompanyDatasourceImpl implements ICompanyDatasource {
  final IRemoteStorageServiceAPI _iRemoteStorageService;

  CompanyDatasourceImpl(this._iRemoteStorageService);

  @override
  Future<List<Map<String, dynamic>>> getAllCompanies() async {
    final response =
        await _iRemoteStorageService.getAllItens(map: APIRoutes.listarEmpresas);

    return response;
  }
}
