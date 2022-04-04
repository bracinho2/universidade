import 'package:flutter/foundation.dart';
import 'package:universidade/src/company/domain/entities/company_entity.dart';
import 'package:universidade/src/company/domain/usecases/get_all_companies.dart';

class CompanyController extends ChangeNotifier {
  final IGetAllCompaniesUseCase _iGetAllCompaniesUseCase;

  var isLoading = false;
  var hasData = false;
  var hasError = false;

  List<CompanyEntity> items = [];

  CompanyController(this._iGetAllCompaniesUseCase);

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
      final response = await _iGetAllCompaniesUseCase.call();
      items = response;
      update(hasData: true);
    } catch (e) {
      print(e);
      update(hasError: true);
    }
  }
}
