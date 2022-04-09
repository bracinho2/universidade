import 'package:flutter/material.dart';
import 'package:universidade/shared/shared_preferences/local_storage_service_interface.dart';
import 'package:universidade/src/auth/infra/mapppers/auth_mappers.dart';
import 'package:universidade/src/auth/presenter/page/login_page.dart';
import 'package:universidade/src/home/home_page.dart';

class AuthenticationController {
  final ILocalStoragePreferences _sharedPreferencesService;

  AuthenticationController(
    this._sharedPreferencesService,
  );

  LoggedUserMapper? _user;

  LoggedUserMapper? get user => _user;

  void load(BuildContext context) async {
    var user = await _sharedPreferencesService.load(info: 'user');

    if (user != null) {
      _user = LoggedUserMapper.fromJson(user);
    }

    navigatorForward(context, _user);
  }

  navigatorForward(BuildContext context, LoggedUserMapper? user) {
    if (user != null) {
      _sharedPreferencesService.save(info: 'user', data: user.toJson());
    }

    if (user != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomePage()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const LoginPage()));
    }
  }

  logOut(BuildContext context) {
    _sharedPreferencesService.remove(info: 'user');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const LoginPage()));
  }
}
