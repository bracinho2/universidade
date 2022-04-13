import 'package:flutter/material.dart';

import 'package:universidade/src/students/states/student_state.dart';

import '../../domain/usecases/get_all_students.dart';

class StudentHomeStore extends ValueNotifier<StudentState> {
  final IGetAllStudentUseCase _iGetAllStudentUseCase;
  StudentHomeStore(
    this._iGetAllStudentUseCase,
  ) : super(EmptyStudentState());

  Future<void> fetchStudents() async {
    value = LoadingStudentState();
    try {
      final students = await _iGetAllStudentUseCase.call();
      value = SuccessStudentState(students);
    } catch (e) {
      value = ErrorStudentState(e.toString());
    }
  }
}
