import 'package:flutter/widgets.dart';
import '../theme/theme.dart';
class CustomGradient extends StatelessWidget {
  final Widget child;

  const CustomGradient({
     Key? key,
     required this.child
  }) : super(key: key);

  Shader _createShader(bounds) {
    return ColorsPalette.gradient.createShader(bounds);
  }

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: _createShader,
      child: child
    );
  }
}