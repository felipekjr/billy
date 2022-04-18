import 'package:flutter/material.dart';
import 'package:micro_commons_design_system/micro_commons_design_system.dart';

import '../widgets/widgets.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({ Key? key }) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Status',
        action: IconButton(
          icon: const Icon(Icons.tune),
          tooltip: 'Ajustes',
          onPressed: () => Navigator.pushNamed(context, '/settings'),
        ),
      ),
      bottomNavigationBar: const BottomBar(index: 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Spacing.x4,
            horizontal: Spacing.x4
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text('Em breve...', style: TextStyles.title(color: ColorsPalette.currentLine)))
          ]),
        ),
      )
    );
  }
}