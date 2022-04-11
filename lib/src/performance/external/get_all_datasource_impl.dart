import 'package:universidade/core/api_router.dart';
import 'package:universidade/src/performance/external/api/service/get_all_performance_remote_service_interface.dart';
import 'package:universidade/src/performance/infra/datasource/get_all_performance_datasource_interface.dart';

class GetAllPerformanceDatasourceImpl implements IGetAllPerformanceDatasource {
  final IGetAllPerformanceRemoteStorage _iRemoteStorageServicePerformanceAPI;

  GetAllPerformanceDatasourceImpl(
    this._iRemoteStorageServicePerformanceAPI,
  );

  @override
  Future<List<Map<String, dynamic>>> getAllPerformances() async {
    final response = await _iRemoteStorageServicePerformanceAPI.getAllItens(
      map: APIRoutes.consultaDesempenhoGeral,
    );

    return response;
  }
}
