import 'package:universidade/src/performance/domain/entities/performance_entity.dart';
import 'package:universidade/src/performance/domain/repositories/get_filtered_performances_repository_interface.dart';
import 'package:universidade/src/performance/infra/datasource/get_filtered_performance_datasource_interface.dart';
import 'package:universidade/src/performance/infra/mappers/performance_mappers.dart';

class GetFilteredPerformanceRepositoryImpl
    implements IGetFilteredPerformanceRepository {
  final IGetFilteredPerformanceDatasource _getAllPerformanceDatasource;

  GetFilteredPerformanceRepositoryImpl(
    this._getAllPerformanceDatasource,
  );

  @override
  Future<List<PerformanceEntity>> getFilteredPerformances(
      {required String filter}) async {
    final response = await _getAllPerformanceDatasource.getFilteredPerformances(
        filter: filter);

    final List<PerformanceEntity> list = [];

    for (var element in response) {
      final performance = PerformanceMapper.fromMap(element);
      list.add(performance);
    }

    return list;
  }
}
