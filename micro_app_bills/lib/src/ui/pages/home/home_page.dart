import 'package:flutter/material.dart';
import 'package:micro_commons_deps/micro_commons_deps.dart';
import 'package:micro_commons_design_system/micro_commons_design_system.dart';

import './new_expense_page.dart';
import './expenses_page.dart';

import '../../widgets/widgets.dart';

class HomePage extends HookWidget {
  const HomePage({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 2);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Despesas',
        height: 100,
        action: IconButton(
          icon: const Icon(Icons.tune),
          tooltip: 'Ajustes',
          onPressed: () => Navigator.pushNamed(context, '/settings'),
        ),
        tabBar: TabBar(
          controller: tabController,
          indicatorColor: ColorsPalette.green,
          unselectedLabelColor: Colors.grey,
          labelColor: ColorsPalette.foreground,
          tabs: const [
            Tab(text: 'Despesas'),
            Tab(text: 'Nova despesa'),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(),
      body: TabBarView(
        controller: tabController,
        children: [
          ExpensesPage(),
          const NewExpensePage()
        ]
      )
    );
  }
}