import 'package:universidade/src/auth/domain/credencial_params.dart';

abstract class IAuthDatasource {
  Future<Map<String, dynamic>?> login(CredentialsParams params);
}
