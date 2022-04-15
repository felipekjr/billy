import 'package:flutter/widgets.dart';
import 'package:micro_commons_deps/micro_commons_deps.dart';

class Logo extends StatelessWidget {
  const Logo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(
        'assets/images/billy.svg',
        semanticsLabel: 'Billy Logo'
      ),
    );
  }
}