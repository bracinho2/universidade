import 'package:universidade/src/performance/domain/entities/performance_entity.dart';
import 'package:universidade/src/performance/domain/repositories/get_all_performances_repository_interface.dart';

abstract class IGetAllPerfomancesUsecase {
  Future<List<PerformanceEntity>> call();
}

class GetAllPerformanceUsecaseImpl implements IGetAllPerfomancesUsecase {
  final IGetAllPerformanceRepository _performanceRepository;

  GetAllPerformanceUsecaseImpl(this._performanceRepository);

  @override
  Future<List<PerformanceEntity>> call() {
    return _performanceRepository.getAllPerformances();
  }
}
