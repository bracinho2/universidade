import 'package:provider/provider.dart';
import 'package:universidade/src/auth/domain/repositories/auth_repository_interface.dart';
import 'package:universidade/src/auth/domain/usecases/login_usecases.dart';
import 'package:universidade/src/auth/external/auth_datasource_impl.dart';
import 'package:universidade/src/auth/infra/datasource/auth_datasource.dart';
import 'package:universidade/src/auth/infra/repositories/auth_repository_impl.dart';
import 'package:universidade/src/auth/presenter/store/auth_store.dart';

final authModule = [
  Provider<IAuthDatasource>(create: (context) => AuthDatasourceImpl()),
  Provider<IAuthRepository>(
      create: (context) => AuthRepositoryImpl(context.read())),
  Provider<ILoggedUserCase>(create: (context) => LoginUsercase(context.read())),
  Provider<AuthStore>(
      create: (context) => AuthStore(context.read(), context.read())),
];
