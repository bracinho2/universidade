import 'package:universidade/src/students/domain/entities/student_entity.dart';

abstract class StudentState {
  const StudentState();
}

class EmptyStudentState extends StudentState {}

class LoadingStudentState extends StudentState {}

class ErrorStudentState extends StudentState {
  final String message;
  const ErrorStudentState(this.message);
}

class SuccessStudentState extends StudentState {
  final List<StudentEntity> students;
  const SuccessStudentState(this.students);
}
