import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universidade/src/students/presenter/company_store.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({
    Key? key,
  }) : super(key: key);

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      context.read<StudentStore>().fetchData();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final studentStore = context.watch<StudentStore>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
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
                final company = studentStore.items[index];
                print(company.id);
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  child: ListTile(
                    title: Text(company.name),
                    subtitle: Text(company.cpf),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    onTap: () {
                      print(company.id);
                      print(company.cpf);
                    },
                  ),
                );
              },
            );
          } else if (studentStore.hasError) {
            return const Center(child: Text('Ooops...'));
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
