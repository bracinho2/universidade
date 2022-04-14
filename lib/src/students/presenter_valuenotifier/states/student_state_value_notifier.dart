import 'package:universidade/src/students/domain/entities/student_entity.dart';

abstract class StudentStateValueNotifier {
  const StudentStateValueNotifier();
}

class EmptyStudentState extends StudentStateValueNotifier {}

class LoadingStudentState extends StudentStateValueNotifier {}

class ErrorStudentState extends StudentStateValueNotifier {
  final String message;
  const ErrorStudentState(this.message);
}

class SuccessStudentState extends StudentStateValueNotifier {
  final List<StudentEntity> students;
  const SuccessStudentState(this.students);
}
