import 'package:universidade/src/performance/domain/entities/performance_entity.dart';

abstract class IGetFilteredPerformanceRepository {
  Future<List<PerformanceEntity>> getFilteredPerformances(
      {required String filter});
}
