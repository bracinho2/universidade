import 'package:flutter/material.dart';
import 'package:universidade/src/company/presenter/company_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CompanyPage(),
    );
  }
}
