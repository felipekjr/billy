import 'package:flutter/material.dart';
import 'package:micro_commons_design_system/micro_commons_design_system.dart';

class NewExpensePage extends StatelessWidget {
  const NewExpensePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Spacing.x4,
            horizontal: Spacing.x4
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              form(),
              const SizedBox(height: Spacing.x5),
              SecondaryButton(title: 'Adicionar', onTap: () {})
            ]
          ),
        ),
      ),
    );
  }

  Widget title() => Center(child: Text('Nova despesa', style: TextStyles.sectionTitle()));
  Widget form() => Column(children: [
    Input(
      label: 'Nome',
      hint: 'Nome da despesa',
      error: false,
      errorText: 'Nome inválido',
      onChanged: (String v) {},
    ),
    formSpacing(),
    Input(
      label: 'Valor',
      hint: 'R\$ 00,00',
      error: false,
      errorText: 'Nome inválido',
      onChanged: (String v) {},
    ),
    formSpacing(),
    toggle(),
    formSpacing(),
    Input(
      label: 'Data',
      hint: 'Data de pagamento',
      error: false,
      errorText: 'Nome inválido',
      onChanged: (String v) {},
    ),
  ]);

  Widget toggle() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('Despesa recorrente?', style: TextStyles.normal()),
      Switch(
        activeColor: ColorsPalette.green,
        value: true, 
        onChanged: (bool v) {}
      ),
    ]
  );

  Widget formSpacing() => const SizedBox(
    height: Spacing.x3,
  );
  
}