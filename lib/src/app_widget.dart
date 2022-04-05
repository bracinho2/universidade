import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universidade/src/company/company_module.dart';
import 'package:universidade/src/company/presenter/company_page.dart';
import 'package:universidade/src/company/presenter/company_page2.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...companyModule,
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CompanyPageTest(),
      ),
    );
  }
}
