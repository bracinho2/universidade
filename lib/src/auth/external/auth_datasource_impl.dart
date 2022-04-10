import 'package:universidade/src/auth/domain/credencial_params.dart';
import 'package:universidade/src/auth/infra/datasource/auth_datasource.dart';

class AuthDatasourceImpl implements IAuthDatasource {
  @override
  Future<Map<String, dynamic>?> login(CredentialsParams params) async {
    final user = {
      'id': '1',
      'usuario': 'teste',
      'senha': 'teste',
      'empresa': '3',
      'perfil': 'gerente'
    };

    if (params.usuario == user['usuario'] && params.senha == user['senha']) {
      return user;
    } else {
      return null;
    }
  }
}
