import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:universidade/src/company/presenter/company_store.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({Key? key}) : super(key: key);

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  final controller = GetIt.instance.get<CompanyController>();

  @override
  void initState() {
    controller.fetchData();
    controller.addListener(listener);
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(listener);
    super.dispose();
  }

  void listener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Companies'),
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (_, __) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.hasData) {
            return ListView.builder(
              itemCount: controller.items.length,
              itemBuilder: (context, index) {
                final company = controller.items[index];
                print(company.id);
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  child: ListTile(
                    title: Text(company.name),
                    subtitle: Text(company.cnpj),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    onTap: () {
                      print(company.id);
                      print(company.cnpj);
                    },
                  ),
                );
              },
            );
          } else if (controller.hasError) {
            return const Center(child: Text('Ooops...'));
          } else {
            return const Center(child: Text('Clique'));
          }
        },
      ),
    );
  }
}
