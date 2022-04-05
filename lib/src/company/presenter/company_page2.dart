import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:universidade/src/company/presenter/company_store.dart';

class CompanyPageTest extends StatefulWidget {
  const CompanyPageTest({
    Key? key,
  }) : super(key: key);

  @override
  State<CompanyPageTest> createState() => _CompanyPageTestState();
}

class _CompanyPageTestState extends State<CompanyPageTest> {
//Dica para quem usa provider com change notifier
//ao chamar o controller ele conflita com o notifyListers por conta
//da sincronicidade da construcao do widget e a atualizacao do mesmo.
//Chamem o WidgetBinding e ele vai chamar o controller apenas depois de construir
//o widget. É uma solucao interessante especialmente para os iniciantes
//Obrigado:
//Jacob
//Dani Fernandes
//Jessica

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      context.read<CompanyController>().fetchData();
    });
  }

  //bracinho
  //iniciante em flutter
  //Sulina/Toledo-PR

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final companyController = context.watch<CompanyController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Companies'),
      ),
      body: AnimatedBuilder(
        animation: companyController,
        builder: (context, __) {
          if (companyController.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (companyController.hasData) {
            return ListView.builder(
              itemCount: companyController.items.length,
              itemBuilder: (context, index) {
                final company = companyController.items[index];
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
          } else if (companyController.hasError) {
            return const Center(child: Text('Ooops...'));
          } else {
            return const Center(child: Text('Bah!'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        companyController.fetchData();
      }),
    );
  }
}
