import 'package:flutter/material.dart';
import 'package:micro_commons_design_system/micro_commons_design_system.dart';
import 'dart:math' as math;

import '../../../domain/entities/entities.dart';
import 'settings.dart';

class SettingsPage extends StatefulWidget {
  final SettingsPresenter presenter;
  const SettingsPage({ Key? key, required this.presenter }) : super(key: key);

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
              horizontal: Spacing.x2
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                budgetContainer(),
                const SizedBox(height: Spacing.x5),
                profileContainer(),
                const SizedBox(height: Spacing.x4),
                linkSection(title: 'Contribua', itens: const [
                  LinkItemEntity(name: 'Repositório', url: 'https://github.com/felipekjr/billy')
                ]),
                const SizedBox(height: Spacing.x4),
                linkSection(title: 'Organizadores', itens: const [
                  LinkItemEntity(name: 'Felipe Rodrigues', url: 'https://www.linkedin.com/in/felipekjr/')
                ]),
                const SizedBox(height: Spacing.x4),
                generalSection()
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
      const SizedBox(height: Spacing.x4),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: Spacing.x5),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: ColorsPalette.currentLine),
          ),
        ),
        child: TextField(
          style: TextStyles.title().merge(const TextStyle(fontSize: 40)),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration:InputDecoration(
            contentPadding: const EdgeInsets.all(0),
            hintText: 'R\$ 00,00',
            hintStyle: TextStyles.title(color: ColorsPalette.currentLine)
              .merge(const TextStyle(fontSize: 40)),
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
    padding: const EdgeInsets.all(Spacing.x2),
    decoration: BoxDecoration(
      color: ColorsPalette.black2,
      borderRadius: const BorderRadius.all(Radius.circular(5))
    ),    
    child: Text(text, style: TextStyles.normal()),
  );

  Widget linkSection({
    required String title,
    required List<LinkItemEntity> itens
  }) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: TextStyles.sectionTitle()),
      const SizedBox(height: Spacing.x1Half),
      ...itens.map((e) => linkItem(e)).toList()
    ],
  );

  Widget linkItem(LinkItemEntity item) => GestureDetector(
    onTap: () => widget.presenter.launchUrl(item.url),
    child: Container(
      padding: const EdgeInsets.all(Spacing.x2),
      decoration: BoxDecoration(
        color: ColorsPalette.currentLine,
        borderRadius: const BorderRadius.all(Radius.circular(5))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item.name, style: TextStyles.normal()),
          Transform.rotate(
            angle: -math.pi / 4,
            child: Icon(Icons.arrow_forward, color: ColorsPalette.foreground)
          )
        ]
      ),
    ),
  );

  Widget generalSection() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Geral', style: TextStyles.sectionTitle()),
      const SizedBox(height: Spacing.x1Half),
      exit()
    ]
  );

  Widget exit() => GestureDetector(
    onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/onboarding', (Route<dynamic> route) => false),
    child: Container(
      padding: const EdgeInsets.all(Spacing.x2),
      decoration: BoxDecoration(
        color: ColorsPalette.black2,
        borderRadius: const BorderRadius.all(Radius.circular(5))
      ),    
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.exit_to_app, color: ColorsPalette.red),
          const SizedBox(width: Spacing.x1Half),
          Text('Sair', style: TextStyles.medium(color: ColorsPalette.red))
        ]
      ),
    ),
  );
}