import 'package:bloc/bloc.dart';

import '../../domain/usecases/get_all_students.dart';
import '../events/student_events.dart';
import '../states/student_state_bloc.dart';

class StudentBloc extends Bloc<StudentEvent, StudentStateBloc> {
  final IGetAllStudentUseCase _iGetAllStudentUseCase;
  StudentBloc(
    this._iGetAllStudentUseCase,
  ) : super(EmptyStudentState()) {
    on<FetchStudentsEvent>(_fetchStudents);
    on<ClearStudentsEvent>((event, emit) {
      emit(const SuccessStudentState([]));
    });
  }

  Future<void> _fetchStudents(
      FetchStudentsEvent event, Emitter<StudentStateBloc> emit) async {
    emit(LoadingStudentState());
    try {
      final students = await _iGetAllStudentUseCase.call();
      emit(SuccessStudentState(students));
    } catch (e) {
      emit(ErrorStudentState(e.toString()));
    }
  }
}
