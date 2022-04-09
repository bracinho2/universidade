import 'package:universidade/src/auth/domain/errors/errors.dart';
import 'package:universidade/src/auth/domain/entities/logged_user.dart';
import 'package:universidade/src/auth/domain/credencial_params.dart';
import 'package:dartz/dartz.dart';
import 'package:universidade/src/auth/domain/repositories/auth_repository_interface.dart';
import 'package:universidade/src/auth/infra/datasource/auth_datasource.dart';
import 'package:universidade/src/auth/infra/mapppers/auth_mappers.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final IAuthDatasource _iAuthDatasource;

  AuthRepositoryImpl(this._iAuthDatasource);
  @override
  Future<Either<AuthException, LoggedUser?>> login(
      CredentialsParams params) async {
    try {
      final response = await _iAuthDatasource.login(params);
      LoggedUser? user;

      if (response != null) {
        user = LoggedUserMapper.fromMap(response);
      } else {
        user = null;
      }

      return Right(user);
    } on AuthException catch (e) {
      return Left(e);
    } on Exception {
      return Left(AuthException(message: 'Exception Error'));
    }
  }
}
