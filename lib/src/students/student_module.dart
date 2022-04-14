import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:universidade/shared/service/remote_service_impl.dart';
import 'package:universidade/shared/service/remote_service_interface.dart';
import 'package:universidade/src/students/domain/repositories/student_repository.dart';
import 'package:universidade/src/students/domain/usecases/get_all_students.dart';
import 'package:universidade/src/students/external/api/api_datasource_impl.dart';
import 'package:universidade/src/students/infra/datasource/student_datasource.dart';
import 'package:universidade/src/students/infra/repositories/student_repository_impl.dart';
import 'package:universidade/src/students/presenter_bloc/blocs/student_bloc.dart';

import 'package:universidade/src/students/presenter_changenotifier/student_store_change_notifier.dart';
import 'package:universidade/src/students/presenter_valuenotifier/store/student_store.dart';

final studentModule = [
  Provider<IRemoteStorageServiceAPI>(
      create: (context) => RemoteServiceImpl(context.read())),
  Provider<IStudentDatasource>(
      create: (context) => StudentDatasourceImpl(context.read())),
  Provider<IStudentRepository>(
      create: (context) =>
          StudentRepositoryImpl(context.read(), context.read())),
  Provider<IGetAllStudentUseCase>(
      create: (context) => GetAllStudentUsecase(context.read())),

  //Change Notifier
  ChangeNotifierProvider(
      create: (context) => StudentStoreChangeNotifier(context.read())),

  //Value Notifier
  ChangeNotifierProvider(
      create: (context) => StudentHomeStoreValueNotifier(context.read())),

  //Bloc
  BlocProvider(create: (context) => StudentBloc(context.read())),
];
