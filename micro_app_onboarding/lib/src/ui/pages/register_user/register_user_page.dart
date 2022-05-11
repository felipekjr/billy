import 'package:flutter/material.dart';
import 'package:micro_commons_design_system/micro_commons_design_system.dart';

import '../../../presentation/helpers/helpers.dart';
import '../../helpers/helpers.dart';
import '../../widgets/widgets.dart';
import 'register_user_presenter.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      title: 'Cadastro', 
      state: widget.presenter.stateNotifier, 
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title(),
            const SizedBox(height: Spacing.x5),
            form(),
            const SizedBox(height: Spacing.x5),
          ],
        ),
        button(),
      ], 
      onError: () {
        showErrorDialog(context, widget.presenter.stateNotifier.value.description);
      }, 
      onSuccess: (String message) {
        showSuccessSnackbar(context, message);
        Navigator.pop(context);
      },
    );
  }

  Widget title() => Text(
    'Abra sua conta',
    style: TextStyles.title(),
  );

  Widget form() => ValueListenableBuilder<bool>(
    valueListenable: widget.presenter.buttonClickedNotifier,
    builder: (context, buttonClicked, _) {
      return ValueListenableBuilder<Map<UserFields, bool>>(
        valueListenable: widget.presenter.fieldErrorsMapNotifier,
        builder: (context, errorsMap, _) {
          return Column(
            children: [
              Input(
                label: 'Nome',
                hint: 'Digite seu nome',
                error: buttonClicked && errorsMap[UserFields.name] == true,
                errorText: 'Nome inválido',
                onChanged: (String v) {
                  widget.presenter.validateField(UserFields.name, v);
                },
              ),
              formSpacing(),
              Input(
                label: 'E-mail',
                hint: 'Digite seu e-mail',
                error: buttonClicked && errorsMap[UserFields.email] == true,
                errorText: 'E-mail inválido',
                onChanged: (String v) {
                  widget.presenter.validateField(UserFields.email, v);
                },
              ),
              formSpacing(),
              Input(
                label: 'Telefone',
                hint: 'Digite seu telefone',
                error: buttonClicked && errorsMap[UserFields.phoneNumber] == true,
                errorText: 'Telefone inválido',
                onChanged: (String v) {
                  widget.presenter.validateField(UserFields.phoneNumber, v);
                },
              ),
              formSpacing(),
              Input(
                label: 'Senha',
                hint: 'Digite sua senha',
                error: buttonClicked && errorsMap[UserFields.password] == true,
                errorText: 'Senha inválida',
                obscure: true,
                onChanged: (String v) {
                  widget.presenter.validateField(UserFields.password, v);
                },
              ),
            ]
          );
        }
      );
    }
  );

  Widget button() =>  ValueListenableBuilder<UIState>(
    valueListenable: widget.presenter.stateNotifier,
    builder: (context, state, _) {
      return PrimaryButton(
        title: 'Cadastrar',
        onTap: widget.presenter.register,
        loading: state is UILoadingState,
      );
    }
  );

  Widget formSpacing() => const SizedBox(
    height: Spacing.x3,
  );
}