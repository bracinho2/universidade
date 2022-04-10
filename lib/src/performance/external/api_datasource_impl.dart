import 'package:universidade/core/api_router.dart';
import 'package:universidade/src/performance/external/api/service/performance_remote_service_interface.dart';

import 'package:universidade/src/performance/infra/datasource/performance_datasource_interface.dart';

class PerformanceDatasourceImpl implements IPerformanceDatasource {
  final IRemoteStorageServicePerformanceAPI
      _iRemoteStorageServicePerformanceAPI;

  PerformanceDatasourceImpl(
    this._iRemoteStorageServicePerformanceAPI,
  );

  @override
  Future<List<Map<String, dynamic>>> getAllPerformances() async {
    final response = await _iRemoteStorageServicePerformanceAPI.getAllItens(
      map: APIRoutes.consultaDesempenhoAluno(idAluno: '7'),
    );

    return response;
  }
}
