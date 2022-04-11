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

  static Map<String, dynamic> listarEmpresasCNPJ = {
    "dominio": API.dominio,
    "senha": API.senha,
    "classe": "empresa",
    "metodo": "listar_por_cnpj",
    "cnpj": "08.695.361/0001-01"
  };

  static Map<String, dynamic> listarAlunos = {
    "dominio": API.dominio,
    "senha": API.senha,
    "classe": "aluno",
    "metodo": "listar"
  };

  static Map<String, dynamic> consultaUsuario = {
    "dominio": API.dominio,
    "senha": API.senha,
    "classe": "usuario",
    "metodo": "listar"
  };

  static Map<String, dynamic> consultaDesempenhoGeral = {
    "dominio": "insidesistemas",
    "senha": "*tjZl\$a^Zs9A",
    "classe": "desempenho",
    "metodo": "listar"
  };

  static Map<String, dynamic> consultaDesempenhoAluno({
    required String filter,
  }) {
    return {
      "dominio": API.dominio,
      "senha": API.senha,
      "classe": "desempenho",
      "metodo": "listarTreinamentosFinalizadosAluno",
      "id_aluno": filter
    };
  }
}
