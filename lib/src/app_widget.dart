import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universidade/shared/shared_preferences/local_storage_service_impl.dart';
import 'package:universidade/shared/shared_preferences/local_storage_service_interface.dart';
import 'package:universidade/src/auth/auth_module.dart';
import 'package:universidade/src/authentication/auth_controller_save_local_user.dart';
import 'package:universidade/src/company/company_module.dart';
import 'package:universidade/src/splash/splash_page.dart';
import 'package:universidade/src/students/student_module.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => Dio()),
        Provider<ILocalStoragePreferences>(
            create: (context) => LocalStoragePreferences()),
        Provider(create: (context) => AuthenticationController(context.read())),
        ...companyModule,
        ...studentModule,
        ...authModule,
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}
