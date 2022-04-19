import 'package:flutter/material.dart';
import '../theme/theme.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const PrimaryButton({
    Key? key,
    required this.title,
    required this.onTap
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap, 
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)
        ),
        onPrimary: ColorsPalette.black
      ),
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.black,
          gradient: ColorsPalette.gradient,
          borderRadius: BorderRadius.circular(50)
        ),
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(Spacing.x2Half),
            child: Text(title, style: TextStyles.buttonText(color: ColorsPalette.black2)),
          ),
        ),
      ),
    );
  }
}