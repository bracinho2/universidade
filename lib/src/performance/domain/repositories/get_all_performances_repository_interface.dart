import 'package:universidade/src/performance/domain/entities/performance_entity.dart';

abstract class IGetAllPerformanceRepository {
  Future<List<PerformanceEntity>> getAllPerformances();
}
