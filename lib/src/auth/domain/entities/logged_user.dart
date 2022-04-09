class LoggedUser {
  final String id;
  final String usuario;
  final String senha;
  final String empresa;
  final String perfil;
  LoggedUser({
    required this.id,
    required this.usuario,
    required this.senha,
    required this.empresa,
    required this.perfil,
  });

  @override
  String toString() {
    return 'LoggedUser(id: $id, usuario: $usuario, senha: $senha, empresa: $empresa, perfil: $perfil)';
  }
}
