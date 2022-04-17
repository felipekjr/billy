import 'package:flutter/widgets.dart';
import '../theme/theme.dart';
class Logo extends StatelessWidget {
  const Logo({ Key? key }) : super(key: key);

  Shader _createShader(bounds) {
    return ColorsPalette.logoGradient.createShader(bounds);
  }

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: _createShader,
      child: Text(
        'billy',
        style: TextStyle(
          fontFamily: 'Allrox',
          fontSize: 32,
          color: ColorsPalette.foreground
        )
      ),
    );
  }
}