import 'package:provider/provider.dart';
import 'package:universidade/src/performance/domain/repositories/performance_repository_interface.dart';
import 'package:universidade/src/performance/domain/usecases/performances_usecases.dart';
import 'package:universidade/src/performance/external/api/service/performance_remote_service_impl.dart';
import 'package:universidade/src/performance/external/api/service/performance_remote_service_interface.dart';
import 'package:universidade/src/performance/external/api_datasource_impl.dart';
import 'package:universidade/src/performance/infra/datasource/performance_datasource_interface.dart';
import 'package:universidade/src/performance/infra/repositories/performance_repository_impl.dart';
import 'package:universidade/src/performance/presenter/store/performance_store.dart';

final performanceModule = [
  Provider<IRemoteStorageServicePerformanceAPI>(
      create: (context) => PerformanceRemoteServiceImpl(context.read())),
  Provider<IPerformanceDatasource>(
      create: (context) => PerformanceDatasourceImpl(context.read())),
  Provider<IPerformanceRepository>(
      create: (context) => PerformanceRepositoryImpl(context.read())),
  Provider<IGetAllPerfomancesUsecase>(
      create: (context) => GetAllPerformanceUsecaseImpl(context.read())),
  ChangeNotifierProvider(create: (context) => PerformanceStore(context.read())),
];
