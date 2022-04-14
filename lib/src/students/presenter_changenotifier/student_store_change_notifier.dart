import 'package:flutter/foundation.dart';
import 'package:universidade/src/students/domain/entities/student_entity.dart';

import 'package:universidade/src/students/domain/usecases/get_all_students.dart';

class StudentStoreChangeNotifier extends ChangeNotifier {
  final IGetAllStudentUseCase _iGetAllStudentUseCase;

  var isLoading = false;
  var hasData = false;
  var hasError = false;

  List<StudentEntity> items = [];

  StudentStoreChangeNotifier(this._iGetAllStudentUseCase);

  void update({
    bool isLoading = false,
    bool hasData = false,
    bool hasError = false,
  }) {
    this.isLoading = isLoading;
    this.hasData = hasData;
    this.hasError = hasError;

    notifyListeners();
  }

  Future<void> fetchData() async {
    try {
      update(isLoading: true);
      final response = await _iGetAllStudentUseCase.call();
      items = response;
      update(hasData: true);
    } catch (e) {
      print(e);
      update(hasError: true);
    }
  }
}
