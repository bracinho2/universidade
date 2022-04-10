import 'package:universidade/src/performance/domain/entities/performance_entity.dart';
import 'package:universidade/src/performance/domain/repositories/performance_repository_interface.dart';
import 'package:universidade/src/performance/infra/datasource/performance_datasource_interface.dart';
import 'package:universidade/src/performance/infra/mappers/performance_mappers.dart';

class PerformanceRepositoryImpl implements IPerformanceRepository {
  final IPerformanceDatasource _iPerformanceDatasource;

  PerformanceRepositoryImpl(
    this._iPerformanceDatasource,
  );

  @override
  Future<List<PerformanceEntity>> getAllPerformances() async {
    final response = await _iPerformanceDatasource.getAllPerformances();

    final List<PerformanceEntity> list = [];

    for (var element in response) {
      final performance = PerformanceMapper.fromMap(element);
      list.add(performance);
    }

    return list;
  }
}
