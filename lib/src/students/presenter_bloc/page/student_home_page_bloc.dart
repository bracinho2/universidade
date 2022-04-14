import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:universidade/src/performance/presenter/page/performance_page.dart';
import 'package:universidade/src/students/presenter_bloc/blocs/student_bloc.dart';
import 'package:universidade/src/students/presenter_bloc/events/student_events.dart';
import 'package:universidade/src/students/presenter_bloc/states/student_state_bloc.dart';

class StudentHomePageBloc extends StatefulWidget {
  const StudentHomePageBloc({
    Key? key,
  }) : super(key: key);

  @override
  State<StudentHomePageBloc> createState() => _StudentHomePageBlocState();
}

class _StudentHomePageBlocState extends State<StudentHomePageBloc> {
  StudentBloc? bloc;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      bloc = Provider.of<StudentBloc>(context, listen: false);
      bloc?.add(FetchStudentsEvent());
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students - Bloc'),
      ),
      body: BlocBuilder<StudentBloc, StudentStateBloc>(
        bloc: bloc,
        builder: (context, state) {
          if (state is EmptyStudentState) {
            return const Center(
              child: Text('Não existem Estudantes Cadastrados!'),
            );
          }
          if (state is LoadingStudentState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ErrorStudentState) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is SuccessStudentState) {
            return ListView.builder(
              itemCount: state.students.length,
              itemBuilder: (context, index) {
                final student = state.students[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  child: ListTile(
                    title: Text(
                      student.name,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      student.sobrenome,
                    ),
                    trailing: Text(
                      '# ' + student.id,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.green,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    tileColor: Colors.white12,
                    selectedTileColor: Colors.black,
                    selectedColor: Colors.amber,
                    onTap: () {
                      print('ID do Estudante: ' + student.id);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PerformancePage(student: student),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
