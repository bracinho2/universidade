import 'package:universidade/core/api_router.dart';
import 'package:universidade/shared/service/remote_service_interface.dart';
import 'package:universidade/src/students/infra/datasource/student_datasource.dart';

class StudentDatasourceImpl implements IStudentDatasource {
  final IRemoteStorageServiceAPI _iRemoteStorageServiceAPI;

  StudentDatasourceImpl(this._iRemoteStorageServiceAPI);

  @override
  Future<List<Map<String, dynamic>>> getAllStudents() async {
    final response = await _iRemoteStorageServiceAPI.getAllItens(
        map: APIRoutes.listarEmpresas);
    return response;
  }
}
