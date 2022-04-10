import 'package:universidade/src/performance/domain/entities/performance_entity.dart';

abstract class IPerformanceRepository {
  Future<List<PerformanceEntity>> getAllPerformances();
}
