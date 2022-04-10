import 'package:flutter/material.dart';
import 'package:universidade/src/performance/domain/entities/performance_entity.dart';
import 'package:universidade/src/performance/domain/usecases/performances_usecases.dart';

class PerformanceStore extends ChangeNotifier {
  final IGetAllPerfomancesUsecase _iGetAllPerfomancesUsecase;

  var isLoading = false;
  var hasData = false;
  var hasError = false;

  List<PerformanceEntity> items = [];
  List<PerformanceEntity> filteredItems = [];

  PerformanceStore(this._iGetAllPerfomancesUsecase);

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
      final response = await _iGetAllPerfomancesUsecase.call();
      items = response;
      filterList();
      update(hasData: true);
    } catch (e) {
      print(e);
      update(hasError: true);
    }
  }

  void filterList({String filter = ''}) {
    if (filter.isNotEmpty) {
      filteredItems = items
          .where((element) =>
              element.aluno.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    } else {
      filteredItems = items;
    }
    notifyListeners();
  }
}
