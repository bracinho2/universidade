import 'package:universidade/src/keys/api_key.dart';

class APIRoutes {
  Map<String, dynamic> cadastrarAluno({
    required String classe,
    required String metodo,
  }) {
    return {
      "dominio": API.dominio,
      "senha": API.senha,
      "classe": classe,
      "metodo": metodo
    };
  }

  static Map<String, dynamic> listarEmpresas = {
    "dominio": API.dominio,
    "senha": API.senha,
    "classe": "empresa",
    "metodo": "listar"
  };

  static Map<String, dynamic> listarTreinamentos = {
    "dominio": API.dominio,
    "senha": API.senha,
    "classe": "treinamento",
    "metodo": "listar"
  };
}
