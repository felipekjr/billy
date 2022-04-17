import 'package:flutter/material.dart';
import 'package:micro_commons_design_system/micro_commons_design_system.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({ Key? key }) : super(key: key);

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Cadastro',
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                title(),
                const SizedBox(height: Spacing.x5),
                form(),
                const SizedBox(height: Spacing.x5),
                button(),
            ]),
          ),
        ),
      )
    );
  }

  Widget title() => Text(
    'Abra sua conta',
    style: TextStyles.title(),
  );

  Widget form() => Column(
    children: [
      Input(
        label: 'Nome',
        hint: 'Digite seu nome',
        error: true,
        errorText: 'Nome inválido',
        onChanged: (String v) {},
      ),
      formSpacing(),
      Input(
        label: 'E-mail',
        hint: 'Digite seu e-mail',
        error: false,
        errorText: 'E-mail inválido',
        onChanged: (String v) {},
      ),
      formSpacing(),
      Input(
        label: 'Telefone',
        hint: 'Digite seu telefone',
        error: false,
        errorText: 'Telefone inválido',
        onChanged: (String v) {},
      ),
      formSpacing(),
      Input(
        label: 'Senha',
        hint: 'Digite sua senha',
        error: false,
        errorText: 'Senha inválida',
        obscure: true,
        onChanged: (String v) {},
      ),
      formSpacing(),
      Input(
        label: 'Confirmar senha',
        hint: 'Digite sua senha',
        error: false,
        errorText: 'Senha inválida',
        obscure: true,
        onChanged: (String v) {},
      ),
    ]
  );

  Widget button() =>  PrimaryButton(
    title: 'Cadastrar',
    onTap: (){

    }
  );

  Widget formSpacing() => const SizedBox(
    height: Spacing.x3,
  );
}