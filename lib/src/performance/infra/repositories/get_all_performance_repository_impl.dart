import 'package:universidade/src/performance/domain/entities/performance_entity.dart';
import 'package:universidade/src/performance/domain/repositories/get_all_performances_repository_interface.dart';
import 'package:universidade/src/performance/infra/datasource/get_all_performance_datasource_interface.dart';
import 'package:universidade/src/performance/infra/mappers/performance_mappers.dart';

class GetAllPerformanceRepositoryImpl implements IGetAllPerformanceRepository {
  final IGetAllPerformanceDatasource _getAllPerformanceDatasource;

  GetAllPerformanceRepositoryImpl(
    this._getAllPerformanceDatasource,
  );

  @override
  Future<List<PerformanceEntity>> getAllPerformances() async {
    final response = await _getAllPerformanceDatasource.getAllPerformances();

    final List<PerformanceEntity> list = [];

    for (var element in response) {
      final performance = PerformanceMapper.fromMap(element);
      list.add(performance);
    }

    return list;
  }
}
