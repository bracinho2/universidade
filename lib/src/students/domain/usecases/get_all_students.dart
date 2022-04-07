import 'package:universidade/src/students/domain/entities/student_entity.dart';
import 'package:universidade/src/students/domain/repositories/student_repository.dart';

abstract class IGetAllStudentUseCase {
  Future<List<StudentEntity>> call();
}

class GetAllStudentUsecase implements IGetAllStudentUseCase {
  final IStudentRepository _studentRepository;

  GetAllStudentUsecase(this._studentRepository);

  @override
  Future<List<StudentEntity>> call() {
    return _studentRepository.getAllStudents();
  }
}
