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
      height: 60,
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
        items: [
          BottomNavigationBarItem(
            icon: iconContainer(Icons.money_off),
            label: 'Despesas',
          ),
          BottomNavigationBarItem(
            icon: iconContainer(Icons.donut_large),
            label: 'Status',
          ),
        ]
      ),
    );
  }

  Widget iconContainer(IconData icon) => Container(
    margin: const EdgeInsets.only(bottom: Spacing.half),
    child: Icon(icon, size: 24,)
  );
}