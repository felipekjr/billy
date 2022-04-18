import 'package:flutter/material.dart';
import 'package:micro_commons_design_system/micro_commons_design_system.dart';

class BottomBar extends StatelessWidget {
  final int? index;
  const BottomBar({
    Key? key,
    this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: BottomNavigationBar(
        elevation: 0,
        backgroundColor: ColorsPalette.black2,
        selectedItemColor: ColorsPalette.green,
        unselectedItemColor: ColorsPalette.currentLine,
        selectedLabelStyle: TextStyles.small(),
        currentIndex: index ?? 0,
        iconSize: 20,
        onTap: (int index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/bills');
          } else {
            Navigator.pushReplacementNamed(context, '/bills/status');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.money_off),
            label: 'Despesas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.donut_large),
            label: 'Status',
          ),
        ]
      ),
    );
  }
}