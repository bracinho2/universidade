import 'package:provider/provider.dart';
import 'package:universidade/src/performance/domain/repositories/get_all_performances_repository_interface.dart';
import 'package:universidade/src/performance/domain/repositories/get_filtered_performances_repository_interface.dart';
import 'package:universidade/src/performance/domain/usecases/get_all_performances_usecase.dart';
import 'package:universidade/src/performance/domain/usecases/get_filtered_performances_usecase.dart';
import 'package:universidade/src/performance/external/api/service/get_all_performance_remote_service_impl.dart';
import 'package:universidade/src/performance/external/api/service/get_all_performance_remote_service_interface.dart';
import 'package:universidade/src/performance/external/api/service/get_filtered_performance_remote_service_interface.dart';
import 'package:universidade/src/performance/external/api/service/get_filtered_performance_remote_service_impl.dart';
import 'package:universidade/src/performance/external/get_all_datasource_impl.dart';
import 'package:universidade/src/performance/external/get_filtered_datasource_impl.dart';
import 'package:universidade/src/performance/infra/datasource/get_all_performance_datasource_interface.dart';
import 'package:universidade/src/performance/infra/datasource/get_filtered_performance_datasource_interface.dart';
import 'package:universidade/src/performance/infra/repositories/get_all_performance_repository_impl.dart';
import 'package:universidade/src/performance/infra/repositories/get_filtered_performance_repository_impl.dart';
import 'package:universidade/src/performance/presenter/store/performance_store.dart';

final performanceModule = [
  //Get All
  Provider<IGetAllPerformanceRemoteStorage>(
      create: (context) => GetAllPerformanceRemoteStorageImpl(context.read())),
  Provider<IGetAllPerformanceDatasource>(
      create: (context) => GetAllPerformanceDatasourceImpl(context.read())),
  Provider<IGetAllPerformanceRepository>(
      create: (context) => GetAllPerformanceRepositoryImpl(context.read())),
  Provider<IGetAllPerfomancesUsecase>(
      create: (context) => GetAllPerformanceUsecaseImpl(context.read())),

  //Get Filtered
  Provider<IGetFilteredPerformanceRemoteStorage>(
      create: (context) =>
          GetFilteredPerformanceRemoteStorageImpl(context.read())),
  Provider<IGetFilteredPerformanceDatasource>(
      create: (context) =>
          GetFilteredPerformanceDatasourceImpl(context.read())),
  Provider<IGetFilteredPerformanceRepository>(
      create: (context) =>
          GetFilteredPerformanceRepositoryImpl(context.read())),
  Provider<IGetFilteredPerfomancesUsecase>(
      create: (context) => GetFilteredPerformanceUsecaseImpl(context.read())),

  //Store
  ChangeNotifierProvider(
      create: (context) => PerformanceStore(context.read(), context.read())),
];
