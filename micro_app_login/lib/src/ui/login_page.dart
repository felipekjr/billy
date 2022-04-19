import 'package:flutter/material.dart';
import 'package:micro_commons_design_system/micro_commons_design_system.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Login',
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Spacing.x4,
            horizontal: Spacing.x2
          ),
          child: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ]),
          ),
        ),
      )
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
    onTap: (){
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, '/bills');
    }
  );

  Widget formSpacing() => const SizedBox(
    height: Spacing.x3,
  );
}