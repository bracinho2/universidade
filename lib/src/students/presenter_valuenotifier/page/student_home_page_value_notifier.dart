import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universidade/src/performance/presenter/page/performance_page.dart';
import 'package:universidade/src/students/presenter_valuenotifier/states/student_state_value_notifier.dart';
import 'package:universidade/src/students/presenter_valuenotifier/store/student_store.dart';

class StudentHomePageValueNotifier extends StatefulWidget {
  const StudentHomePageValueNotifier({
    Key? key,
  }) : super(key: key);

  @override
  State<StudentHomePageValueNotifier> createState() =>
      _StudentHomePageValueNotifierState();
}

class _StudentHomePageValueNotifierState
    extends State<StudentHomePageValueNotifier> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      context.read<StudentHomeStoreValueNotifier>().fetchStudents();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<StudentHomeStoreValueNotifier>();
    Widget child = Container();

    final state = store.value;

    if (state is EmptyStudentState) {
      child = const Center(
        child: Text('Não existem Estudantes Cadastrados!'),
      );
    }
    if (state is LoadingStudentState) {
      child = const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state is ErrorStudentState) {
      child = Center(
        child: Text(state.message),
      );
    }
    if (state is SuccessStudentState) {
      child = ListView.builder(
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
                    ));
              },
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Students - ValueNotifier'),
      ),
      body: child,
    );
  }
}
