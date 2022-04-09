import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universidade/src/auth/domain/helpers/validator_helpers.dart';
import 'package:universidade/src/auth/presenter/store/auth_store.dart';
import 'package:universidade/src/shared/widgets/button_widget.dart';
import 'package:universidade/src/shared/widgets/input_text_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authStore = context.read<AuthStore>();

    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Form(
            key: authStore.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                InputTextWidget(
                  label: 'usuário',
                  controller: _usernameController,
                  validator: ValidatorHelper.validaString,
                  obscureText: false,
                  enabled: true,
                  minLines: 1,
                  maxLines: 1,
                ),
                InputTextWidget(
                  label: 'senha',
                  controller: _passwordController,
                  validator: ValidatorHelper.validaString,
                  obscureText: true,
                  enabled: true,
                  minLines: 1,
                  maxLines: 1,
                ),
                ButtonWidget(
                  label: 'Entrar',
                  onPressed: () {
                    authStore.validateLoginForm(
                      usuario: _usernameController.text,
                      senha: _passwordController.text,
                      context: context,
                    );

                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
