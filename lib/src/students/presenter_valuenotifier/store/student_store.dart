import 'package:flutter/material.dart';

import '../../domain/usecases/get_all_students.dart';
import '../states/student_state_value_notifier.dart';

class StudentHomeStoreValueNotifier
    extends ValueNotifier<StudentStateValueNotifier> {
  final IGetAllStudentUseCase _iGetAllStudentUseCase;
  StudentHomeStoreValueNotifier(
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
