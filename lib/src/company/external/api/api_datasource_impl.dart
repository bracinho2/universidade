import 'package:universidade/src/company/infra/datasource/company_datasource.dart';
import 'package:universidade/src/company/service/remote_service_interface.dart';

class DatasourceImpl implements ICompanyDatasource {
  final IRemoteStorageService _iRemoteStorageService;

  DatasourceImpl(this._iRemoteStorageService);

  @override
  Future<List<Map<String, dynamic>>> getAllCompanies() async {
    final response = await _iRemoteStorageService.getAllItens();
    return response;
  }
}
