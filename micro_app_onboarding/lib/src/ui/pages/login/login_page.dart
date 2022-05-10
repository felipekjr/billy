import 'package:flutter/material.dart';
import 'package:micro_app_onboarding/src/ui/helpers/show_error_dialog_helper.dart';
import 'package:micro_commons_design_system/micro_commons_design_system.dart';

import '../../widgets/widgets.dart';
import 'login_presenter.dart';

class LoginPage extends StatefulWidget {
  final LoginPresenter presenter;
  const LoginPage({ 
    Key? key,
    required this.presenter
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    widget.presenter.init();
    super.initState();
  }

  @override
  void dispose() {
    widget.presenter.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      title: 'Login', 
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title(),
            const SizedBox(height: Spacing.x5),
            form(),
            const SizedBox(height: Spacing.x4),
            forgotPassword()
          ]
        ),
        button(),
      ], 
      state: widget.presenter.stateNotifier, 
      onError: (){
        showErrorDialog(context, widget.presenter.stateNotifier.value.description);
      }, 
      onSuccess: (String message){
        Navigator.pushNamedAndRemoveUntil(context, '/bills', (Route<dynamic> route) => false);
      }
    );
  }

   Widget title() => Text(
    'Login',
    style: TextStyles.title(),
  );

  Widget form() => Column(
    children: [
      Input(
        label: 'E-mail',
        hint: 'Digite seu e-mail',
        error: false,
        errorText: 'E-mail inválido',
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
    ]
  );

  Widget forgotPassword() => GestureDetector(
    child: Align(
      alignment: Alignment.center,
      child: Text(
        'Esqueci minha senha',
        style: TextStyles.normal().merge(const TextStyle(
          decoration: TextDecoration.underline,
          decorationThickness: 2.0
        )),
      ),
    ),
    onTap: () {},
  );

  Widget button() =>  PrimaryButton(
    title: 'Login',
    onTap: widget.presenter.authenticate
  );

  Widget formSpacing() => const SizedBox(
    height: Spacing.x3,
  );
}