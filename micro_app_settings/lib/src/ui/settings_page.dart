import 'package:flutter/material.dart';
import 'package:micro_commons_design_system/micro_commons_design_system.dart';
import 'dart:math' as math;

class SettingsPage extends StatefulWidget {
  const SettingsPage({ Key? key }) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Ajustes',
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Spacing.x4,
              horizontal: Spacing.x4
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                budgetContainer(),
                const SizedBox(height: Spacing.x5),
                profileContainer(),
                const SizedBox(height: Spacing.x4),
                linkSection(title: 'Contribua', itens: ['Repositório']),
                const SizedBox(height: Spacing.x4),
                linkSection(title: 'Organizadores', itens: ['Felipe Rodrigues'])
              ]
            ),
          ),
        ),
      )
    );
  }

  Widget budgetContainer() => Column(
    children: [
      Text('Orçamento Mensal', style: TextStyles.sectionTitle()),
      const SizedBox(height: Spacing.x2Half),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: Spacing.x5),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: ColorsPalette.currentLine),
          ),
        ),
        child: TextField(
          style: TextStyles.title(),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration:InputDecoration(
            contentPadding: const EdgeInsets.all(0),
            hintText: 'R\$ 00,00',
            hintStyle: TextStyles.title(color: ColorsPalette.currentLine),
            border: InputBorder.none
          )
        ),
      )
    ],
  );

  Widget profileContainer() => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text('Perfil', style: TextStyles.sectionTitle()),
      const SizedBox(height: Spacing.x1Half),
      infoItem('Lorem Ipsum'),
      const SizedBox(height: Spacing.x1),
      infoItem('Lorem Ipsum'),
      const SizedBox(height: Spacing.x1),
      infoItem('Lorem Ipsum'),
      const SizedBox(height: Spacing.x1),
      infoItem('Lorem Ipsum'),
    ],
  );

  Widget infoItem(String text) => Container(
    padding: const EdgeInsets.symmetric(
      vertical: Spacing.x1Half,
      horizontal: Spacing.x2
    ),
    decoration: BoxDecoration(
      color: ColorsPalette.black2,
      borderRadius: const BorderRadius.all(Radius.circular(5))
    ),    
    child: Text(text, style: TextStyles.normal()),
  );

  Widget linkSection({
    required String title,
    required List<String> itens
  }) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: TextStyles.sectionTitle()),
      const SizedBox(height: Spacing.x1Half),
      ...itens.map((e) => Container(
        padding: const EdgeInsets.symmetric(
          vertical: Spacing.x1,
          horizontal: Spacing.x2
        ),
        decoration: BoxDecoration(
          color: ColorsPalette.currentLine,
          borderRadius: const BorderRadius.all(Radius.circular(5))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(e, style: TextStyles.normal()),
            Transform.rotate(
              angle: -math.pi / 4,
              child: Icon(Icons.arrow_forward, color: ColorsPalette.foreground)
            )
          ]
        ),
      )).toList()
    ],
  );
}