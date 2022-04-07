import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:universidade/src/company/presenter/company_store.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({Key? key}) : super(key: key);

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  @override
  void initState() {
    //controller.fetchData();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CompanyController>(context);
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
            return const Center(child: Text('Bah!'));
          }
        },
      ),
    );
  }
}
