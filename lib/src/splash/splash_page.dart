import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universidade/src/authentication/auth_controller_save_local_user.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      controleSplash();
    });
  }

  Future<void> controleSplash() async {
    await Future.delayed(const Duration(seconds: 2));
    context.read<AuthenticationController>().load(context);
  }

  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}

Widget _introScreen() {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text('Slash Page'),
        ],
      ),
    ),
  );
}
