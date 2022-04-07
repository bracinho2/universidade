import 'package:flutter/material.dart';
import 'package:universidade/src/company/presenter/company_page.dart';
import 'package:universidade/src/students/presenter/student_page.dart';

import '../company/presenter/company_page2.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const StudentPage()));
              },
              child: const Text('Students'),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const CompanyPageTest()));
              },
              child: const Text('Companies'),
            ),
          ),
        ],
      ),
    );
  }
}
