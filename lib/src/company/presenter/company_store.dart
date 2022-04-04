import 'package:flutter/foundation.dart';
import 'package:universidade/src/company/domain/entities/company_entity.dart';
import 'package:universidade/src/company/infra/repositories/company_repository_impl.dart';

class CompanyController extends ChangeNotifier {
  final CompanyRepositoryImpl _companyRepositoryImpl;

  var isLoading = false;
  var hasData = false;
  var hasError = false;

  List<CompanyEntity> items = [];

  CompanyController(this._companyRepositoryImpl);

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
      final response = await _companyRepositoryImpl.getAllCompanies();
      items = response;
      update(hasData: true);
    } catch (e) {
      print(e);
      update(hasError: true);
    }
  }
}
