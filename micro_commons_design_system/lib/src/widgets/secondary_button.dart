import 'package:flutter/material.dart';
import '../theme/theme.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SecondaryButton({
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
        onPrimary: ColorsPalette.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        )
      ),
      child: Ink(
        decoration: BoxDecoration(
          color: ColorsPalette.currentLine,
          borderRadius: BorderRadius.circular(50)
        ),
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(Spacing.x2, ),
            child: Text(title, style: TextStyles.buttonText()),
          ),
        ),
      ),
    );
  }
}