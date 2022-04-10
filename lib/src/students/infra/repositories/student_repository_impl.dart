import 'package:universidade/src/authentication/auth_controller_save_local_user.dart';
import 'package:universidade/src/students/domain/entities/student_entity.dart';
import 'package:universidade/src/students/domain/repositories/student_repository.dart';
import 'package:universidade/src/students/infra/datasource/student_datasource.dart';
import 'package:universidade/src/students/infra/mappers/student_mapper.dart';

class StudentRepositoryImpl implements IStudentRepository {
  final IStudentDatasource _iStudentDatasource;
  final AuthenticationController _authenticationController;

  StudentRepositoryImpl(
    this._iStudentDatasource,
    this._authenticationController,
  );

  @override
  Future<List<StudentEntity>> getAllStudents() async {
    final response = await _iStudentDatasource.getAllStudents();
    final usuario = await _authenticationController.loadSavedUser();

    final List<StudentEntity> listStudents = [];

    for (var element in response) {
      final student = StudentMapper.fromMap(element);

      if (usuario != null) {
        if (usuario.empresa == student.empresa) {
          listStudents.add(student);
        }
      }
    }

    print(listStudents.length);

    return listStudents;
  }
}
