import 'package:universidade/src/students/domain/entities/student_entity.dart';
import 'package:universidade/src/students/domain/repositories/student_repository.dart';
import 'package:universidade/src/students/infra/datasource/student_datasource.dart';
import 'package:universidade/src/students/infra/mappers/student_mapper.dart';

class StudentRepositoryImpl implements IStudentRepository {
  final IStudentDatasource _iStudentDatasource;

  StudentRepositoryImpl(this._iStudentDatasource);

  @override
  Future<List<StudentEntity>> getAllStudents() async {
    final response = await _iStudentDatasource.getAllStudents();

    final List<StudentEntity> listStudents = [];

    for (var element in response) {
      final student = StudentMapper.fromMap(element);
      listStudents.add(student);
    }

    return listStudents;
  }
}
