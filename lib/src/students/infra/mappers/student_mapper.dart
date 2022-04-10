import 'package:universidade/src/students/domain/entities/student_entity.dart';

class StudentMapper extends StudentEntity {
  StudentMapper({
    required String id,
    required String name,
    required String sobrenome,
    required String cpf,
    required String empresa,
  }) : super(
          id: id,
          name: name,
          sobrenome: sobrenome,
          cpf: cpf,
          empresa: empresa,
        );

  static Map<String, dynamic> toMap(StudentEntity entity) {
    return {
      'id': entity.id,
      'nome': entity.name,
      'cpf': entity.cpf,
      'empresa': entity.empresa,
    };
  }

  factory StudentMapper.fromMap(Map<String, dynamic> map) {
    return StudentMapper(
      id: map['id'] ?? '',
      name: map['nome'] ?? '',
      sobrenome: map['sobrenome'] ?? '',
      cpf: map['cpf'] ?? '',
      empresa: map['empresa'] ?? '',
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StudentEntity && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
