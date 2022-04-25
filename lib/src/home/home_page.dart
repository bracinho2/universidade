import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universidade/shared/snack_manager/snack_manager.dart';
import 'package:universidade/src/authentication/auth_controller_save_local_user.dart';
import 'package:universidade/src/performance/presenter/page/performance_page.dart';
import 'package:universidade/src/students/presenter_bloc/page/student_home_page_bloc.dart';
import 'package:universidade/src/students/presenter_changenotifier/student_page_change_notifier.dart';
import 'package:universidade/src/students/presenter_valuenotifier/page/student_home_page_value_notifier.dart';
import '../company/presenter/company_page2.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = context.read<AuthenticationController>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const CompanyPageTest()));
              },
              child: const Text('Companies'),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const StudentPageChangeNotifier()));
              },
              child: const Text('Change Notifier - Students'),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const StudentHomePageValueNotifier()));
              },
              child: const Text('Value Notifier - Students'),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const StudentHomePageBloc()));
              },
              child: const Text('Bloc - Students'),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PerformancePage()));
              },
              child: const Text('Desempenho'),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                authController.logOut(context);
              },
              child: const Text('Sair'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        SnackBarManager().showWarning(
          context: context,
          message: 'sucesso',
        );
      }),
    );
  }
}
