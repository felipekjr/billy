import 'package:flutter/material.dart';
import 'package:micro_commons_design_system/micro_commons_design_system.dart';

import '../../../domain/entities/entities.dart';

extension DateTimeExtension on DateTime {
  String label() {
    return '${this.day}/${this.month}/${this.year}';
  }
}

class ExpensesPage extends StatelessWidget {
  ExpensesPage({ Key? key }) : super(key: key);

  final List<ExpenseEntity> expenses = [
    ExpenseEntity(isRecurrent: false, name: 'Conta de água', value: 200.00, date: DateTime.now(), isPaid: false),
    ExpenseEntity(isRecurrent: false, name: 'Conta de luz', value: 300.00, date: DateTime.now(), isPaid: false),
    ExpenseEntity(isRecurrent: false, name: 'Fatura cartão', value: 10000.00, date: DateTime.now(), isPaid: true),
    ExpenseEntity(isRecurrent: false, name: 'Conta de água', value: 200.00, date: DateTime.now(), isPaid: true),
    ExpenseEntity(isRecurrent: false, name: 'Conta de água', value: 200.00, date: DateTime.now(), isPaid: false),
    ExpenseEntity(isRecurrent: false, name: 'Conta de água', value: 200.00, date: DateTime.now(), isPaid: false),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Spacing.x2,
            horizontal: 0
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              expensesList()
            ]
          ),
        ),
      ),
    );
  }

  Widget expensesList() => ListView.separated(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (_, int index) {
      return expense(expenses[index]);
    }, 
    separatorBuilder: (context, _) => const SizedBox(height: 1), 
    itemCount: expenses.length
  );

  Widget expense(ExpenseEntity expense) => Material(
    color: ColorsPalette.black,
    child: InkWell(
      onTap: () {},
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      splashColor: ColorsPalette.black2,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: ColorsPalette.black2, width: 1),
          )
        ),
        padding: const EdgeInsets.symmetric(
          vertical: Spacing.x3,
          horizontal: Spacing.x2
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_downward, color: ColorsPalette.red),
                  const SizedBox(width: Spacing.x3),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(expense.name, style: TextStyles.normalBold()),
                      const SizedBox(height: Spacing.x1),
                      Row(children: [
                        Text(expense.date.label(), style: TextStyles.smallThin()),
                        if (expense.isPaid) ...[
                          Text(' - ', style: TextStyles.smallThin()),
                          Text('Pago', style: TextStyles.smallThin(color: ColorsPalette.green)),
                        ]
                      ])
      
                    ]
                  ),
                ],
              ),
            ),   
            Text('R\$ ${expense.value}', style: TextStyles.normalBold()),
          ]
        ),
      ),
    ),
  );
}