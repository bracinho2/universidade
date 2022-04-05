import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:universidade/src/app_widget.dart';
import 'package:universidade/src/company/company_module.dart';

void main() {
  final di = GetIt.instance;

  CompanyDI.inject(di);

  runApp(const AppWidget());
}
