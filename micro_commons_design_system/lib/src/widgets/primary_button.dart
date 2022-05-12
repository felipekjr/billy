import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../theme/theme.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool disabled;
  final bool loading;

  const PrimaryButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.disabled = false,
    this.loading = false
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disabled ? .4 : 1,
      child: ElevatedButton(
        onPressed: disabled || loading ? null : onTap, 
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
              padding: const EdgeInsets.all(Spacing.x2),
              child: !loading ? Text(
                title, 
                style: TextStyles.buttonText(color: ColorsPalette.black2)
              ) : SpinKitThreeBounce(size: 16, color: ColorsPalette.black2),
            ),
          ) 
        ),
      ),
    );
  }
}