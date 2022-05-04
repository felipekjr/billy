import 'package:flutter/material.dart';
import 'package:micro_app_onboarding/src/ui/helpers/ui_state.dart';
import 'package:micro_app_onboarding/src/ui/pages/register_user/register_user_presenter.dart';
import 'package:micro_commons_design_system/micro_commons_design_system.dart';

class RegisterUserPage extends StatefulWidget {
  final RegisterUserPresenter presenter;

  const RegisterUserPage({
    Key? key,
    required this.presenter
  }) : super(key: key);

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  @override
  void initState() {
    widget.presenter.init();
    widget.presenter.stateNotifier.addListener(() {
      final state = widget.presenter.stateNotifier.value;
      if (state is UIErrorState) showErrorDialog(state.description);
      if (state is UISuccessState) Navigator.pop(context);
    });
    super.initState();
  }

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
              horizontal: Spacing.x3
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

  Widget button() =>  ValueListenableBuilder<bool>(
    valueListenable: widget.presenter.formValidNotifier,
    builder: (context, isValid, _) {
      return PrimaryButton(
        title: 'Cadastrar',
        disabled: !isValid,
        onTap: widget.presenter.register
      );
    }
  );

  Widget formSpacing() => const SizedBox(
    height: Spacing.x3,
  );

  Future<void> showErrorDialog(String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erro'),
          content: Center(child: Text(message),),
          actions: <Widget>[
            TextButton(
              child: const Text('Tente novamente'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}