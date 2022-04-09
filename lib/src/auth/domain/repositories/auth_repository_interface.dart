import 'package:dartz/dartz.dart';
import 'package:universidade/src/auth/domain/credencial_params.dart';
import 'package:universidade/src/auth/domain/entities/logged_user.dart';
import 'package:universidade/src/auth/domain/errors/errors.dart';

abstract class IAuthRepository {
  Future<Either<AuthException, LoggedUser?>> login(CredentialsParams params);
}
