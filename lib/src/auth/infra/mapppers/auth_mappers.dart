import 'dart:convert';

import 'package:universidade/src/auth/domain/entities/logged_user.dart';

class LoggedUserMapper extends LoggedUser {
  LoggedUserMapper(
      {required String id,
      required String usuario,
      required String senha,
      required String empresa,
      required String perfil})
      : super(
            id: id,
            usuario: usuario,
            senha: senha,
            empresa: empresa,
            perfil: perfil);

  static LoggedUserMapper fromMap(Map<String, dynamic> map) {
    return LoggedUserMapper(
      id: map['id'],
      usuario: map['usuario'],
      senha: map['senha'],
      empresa: map['empresa'],
      perfil: map['perfil'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'usuario': usuario,
      'senha': senha,
      'empresa': empresa,
      'perfil': perfil,
    };
  }

  String toJson() => json.encode(toMap());

  factory LoggedUserMapper.fromJson(String source) =>
      LoggedUserMapper.fromMap(json.decode(source));
}
