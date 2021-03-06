import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universidade/src/performance/presenter/page/performance_page.dart';
import 'package:universidade/src/students/presenter_changenotifier/student_store_change_notifier.dart';

class StudentPageChangeNotifier extends StatefulWidget {
  const StudentPageChangeNotifier({
    Key? key,
  }) : super(key: key);

  @override
  State<StudentPageChangeNotifier> createState() =>
      _StudentPageChangeNotifierState();
}

class _StudentPageChangeNotifierState extends State<StudentPageChangeNotifier> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      context.read<StudentStoreChangeNotifier>().fetchData();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final studentStore = context.watch<StudentStoreChangeNotifier>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students - Change Notifier'),
      ),
      body: AnimatedBuilder(
        animation: studentStore,
        builder: (context, __) {
          if (studentStore.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (studentStore.hasData) {
            return ListView.builder(
              itemCount: studentStore.items.length,
              itemBuilder: (context, index) {
                final student = studentStore.items[index];
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
          } else if (studentStore.hasError) {
            return const Center(
              child: Text(
                'Ooops...',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            return const Center(child: Text('Bah!'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        studentStore.fetchData();
      }),
    );
  }
}
