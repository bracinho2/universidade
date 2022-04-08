import 'package:universidade/src/students/domain/entities/student_entity.dart';

class StudentMapper extends StudentEntity {
  StudentMapper({
    required String id,
    required String name,
    required String cpf,
  }) : super(
          id: id,
          name: name,
          cpf: cpf,
        );

  static Map<String, dynamic> toMap(StudentEntity entity) {
    return {
      'id': entity.id,
      'nome': entity.name,
      'cpf': entity.cpf,
    };
  }

  factory StudentMapper.fromMap(Map<String, dynamic> map) {
    return StudentMapper(
      id: map['id'] ?? '',
      name: map['nome'] ?? '',
      cpf: map['cpf'] ?? '',
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
