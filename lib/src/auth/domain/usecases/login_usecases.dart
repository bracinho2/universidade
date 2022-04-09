import 'package:dartz/dartz.dart';
import 'package:universidade/src/auth/domain/credencial_params.dart';
import 'package:universidade/src/auth/domain/entities/logged_user.dart';
import 'package:universidade/src/auth/domain/errors/errors.dart';
import 'package:universidade/src/auth/domain/repositories/auth_repository_interface.dart';

abstract class ILoggedUserCase {
  Future<Either<AuthException, LoggedUser?>> call(CredentialsParams params);
}

class LoginUsercase implements ILoggedUserCase {
  final IAuthRepository _iAuthRepository;

  LoginUsercase(this._iAuthRepository);

  @override
  Future<Either<AuthException, LoggedUser?>> call(
      CredentialsParams params) async {
    if (params.usuario.isEmpty) {
      return Left(AuthException(message: 'Informe o Usuário'));
    }
    if (params.senha.isEmpty) {
      return Left(AuthException(message: 'Informe a Senha'));
    }
    return await _iAuthRepository.login(params);
  }
}
