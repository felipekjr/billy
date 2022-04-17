
import 'package:flutter/material.dart';
import '../theme/theme.dart';

class Input extends StatelessWidget {
  final String label;
  final String hint;
  final String errorText;
  final bool error;
  final bool obscure;
  final Function(String) onChanged;

  const Input({
    Key? key, 
    required this.label, 
    required this.hint, 
    required this.errorText, 
    required this.error, 
    required this.onChanged,
    this.obscure = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyles.normalThin(),
      obscureText: obscure,
      decoration:InputDecoration(
        contentPadding: const EdgeInsets.all(Spacing.x3),
        labelText: label,
        hintText: hint,
        hintStyle: TextStyles.normalThin(),
        labelStyle: TextStyles.medium(),
        errorText: error ? errorText : null,
        errorStyle: TextStyles.smallThin(color: ColorsPalette.red),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: ColorsPalette.foreground,
            width: .5
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: ColorsPalette.green,
            width: .5
          )
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: ColorsPalette.red,
            width: .5
          )
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: ColorsPalette.red,
            width: .5
          )
        ),
      ),
      onChanged: onChanged,
    );
  }
}