import 'package:universidade/src/auth/domain/credencial_params.dart';
import 'package:universidade/src/auth/domain/entities/logged_user.dart';

abstract class IAuthDatasource {
  Future<Map<String, dynamic>?> login(CredentialsParams params);
}
