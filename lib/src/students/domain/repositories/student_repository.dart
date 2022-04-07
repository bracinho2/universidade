import 'package:universidade/src/students/domain/entities/student_entity.dart';

abstract class IStudentRepository {
  Future<List<StudentEntity>> getAllStudents();
}
