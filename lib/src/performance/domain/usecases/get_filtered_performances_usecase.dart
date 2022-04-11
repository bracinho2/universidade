import 'package:universidade/src/performance/domain/entities/performance_entity.dart';
import 'package:universidade/src/performance/domain/repositories/get_filtered_performances_repository_interface.dart';

abstract class IGetFilteredPerfomancesUsecase {
  Future<List<PerformanceEntity>> call({required String filter});
}

class GetFilteredPerformanceUsecaseImpl
    implements IGetFilteredPerfomancesUsecase {
  final IGetFilteredPerformanceRepository _performanceRepository;

  GetFilteredPerformanceUsecaseImpl(this._performanceRepository);

  @override
  Future<List<PerformanceEntity>> call({required String filter}) {
    return _performanceRepository.getFilteredPerformances(filter: filter);
  }
}
