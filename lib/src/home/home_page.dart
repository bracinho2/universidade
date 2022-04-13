import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universidade/src/authentication/auth_controller_save_local_user.dart';
import 'package:universidade/src/performance/presenter/page/performance_page.dart';
import '../company/presenter/company_page2.dart';
import '../students/presenter/page/student_home_page.dart';

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
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const StudentHomePage()));
              },
              child: const Text('Students'),
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
    );
  }
}
