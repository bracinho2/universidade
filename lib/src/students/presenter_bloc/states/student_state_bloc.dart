import 'package:universidade/src/students/domain/entities/student_entity.dart';

abstract class StudentStateBloc {
  const StudentStateBloc();
}

class EmptyStudentState extends StudentStateBloc {}

class LoadingStudentState extends StudentStateBloc {}

class ErrorStudentState extends StudentStateBloc {
  final String message;
  const ErrorStudentState(this.message);
}

class SuccessStudentState extends StudentStateBloc {
  final List<StudentEntity> students;
  const SuccessStudentState(this.students);
}
