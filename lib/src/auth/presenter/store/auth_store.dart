import 'package:flutter/material.dart';
import 'package:universidade/src/auth/domain/credencial_params.dart';
import 'package:universidade/src/auth/domain/usecases/login_usecases.dart';
import 'package:universidade/src/auth/infra/mapppers/auth_mappers.dart';
import 'package:universidade/src/authentication/auth_controller_save_local_user.dart';

class AuthStore {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ILoggedUserCase _loginUsercase;
  final AuthenticationController _authenticationController;

  AuthStore(this._loginUsercase, this._authenticationController);

  void validateLoginForm({
    required BuildContext context,
    required String usuario,
    required String senha,
  }) {
    final form = formKey.currentState;
    if (form!.validate()) {
      checkLogin(
        usuario: usuario,
        senha: senha,
        context: context,
      );
    }
  }

  Future<void> checkLogin(
      {required String usuario,
      required String senha,
      required BuildContext context}) async {
    var loggedUser = await _loginUsercase.call(
      CredentialsParams(
        usuario: usuario,
        senha: senha,
      ),
    );

    print(loggedUser);

    var snackBar = SnackBar(
      content: const Text('Suas Credencias não foram encontradas!'),
      action: SnackBarAction(
        label: 'Tentar Novamente!',
        onPressed: () {},
      ),
    );

    loggedUser.fold(
        (l) => {
              ScaffoldMessenger.of(context).showSnackBar(snackBar),
            }, (r) {
      if (r != null) {
        _authenticationController.navigatorForward(
            context, r as LoggedUserMapper);

        return r;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return r;
      }
    });
  }
}
