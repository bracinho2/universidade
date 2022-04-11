import 'package:universidade/core/api_router.dart';
import 'package:universidade/src/performance/external/api/service/get_filtered_performance_remote_service_interface.dart';
import 'package:universidade/src/performance/infra/datasource/get_filtered_performance_datasource_interface.dart';

class GetFilteredPerformanceDatasourceImpl
    implements IGetFilteredPerformanceDatasource {
  final IGetFilteredPerformanceRemoteStorage
      _iRemoteStorageServicePerformanceAPI;

  GetFilteredPerformanceDatasourceImpl(
    this._iRemoteStorageServicePerformanceAPI,
  );

  @override
  Future<List<Map<String, dynamic>>> getFilteredPerformances(
      {required String filter}) async {
    final response = await _iRemoteStorageServicePerformanceAPI.getAllItens(
      map: APIRoutes.consultaDesempenhoAluno(filter: filter),
    );

    return response;
  }
}
