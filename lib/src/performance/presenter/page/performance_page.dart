import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universidade/src/performance/presenter/store/performance_store.dart';
import 'package:universidade/src/students/domain/entities/student_entity.dart';

class PerformancePage extends StatefulWidget {
  final StudentEntity? student;
  const PerformancePage({
    Key? key,
    this.student,
  }) : super(key: key);

  @override
  State<PerformancePage> createState() => _PerformancePageState();
}

class _PerformancePageState extends State<PerformancePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      if (widget.student != null) {
        context
            .read<PerformanceStore>()
            .fetchDataByID(filter: widget.student!.id);
        print('Tem ID de Aluno');
      } else {
        context.read<PerformanceStore>().fetchData();
        print('Não tem ID de Aluno');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final performanceStore = context.watch<PerformanceStore>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Performances'),
      ),
      body: AnimatedBuilder(
        animation: performanceStore,
        builder: (context, __) {
          if (performanceStore.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (performanceStore.hasData) {
            return ListView.builder(
              itemCount: performanceStore.filteredItems.length,
              itemBuilder: (context, index) {
                final performance = performanceStore.filteredItems[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  child: ListTile(
                    title: Text(performance.aluno),
                    subtitle: Text(performance.treinamento),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    onTap: () {
                      print('Nome do Estudante: ' + performance.aluno);
                    },
                    trailing: Text(performance.nota.toString()),
                  ),
                );
              },
            );
          } else if (performanceStore.hasError) {
            return const Center(child: Text('Ooops...'));
          } else {
            return const Center(child: Text('Bah!'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        performanceStore.fetchDataByID(filter: widget.student!.id);
      }),
    );
  }
}
