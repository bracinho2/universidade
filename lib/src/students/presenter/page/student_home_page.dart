import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universidade/src/performance/presenter/page/performance_page.dart';
import 'package:universidade/src/students/presenter/store/student_store.dart';
import 'package:universidade/src/students/states/student_state.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      context.read<StudentHomeStore>().fetchStudents();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<StudentHomeStore>();
    Widget child = Container();

    final state = store.value;

    if (state is EmptyStudentState) {
      child = const Center(
        child: Text('Não existem Produtos Cadastrados!'),
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
        title: const Text('Students'),
      ),
      body: child,
    );
  }
}
