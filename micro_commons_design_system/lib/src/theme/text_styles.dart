import 'package:flutter/widgets.dart';
import './colors_palette.dart';

class TextStyles {
  static TextStyle title({Color? color}) => TextStyle(
    fontSize: 22.0,
    color: color ?? ColorsPalette.foreground,
    fontWeight: FontWeight.bold,
    fontFamily: 'Gotham',
    height: 1.4
  );

  static TextStyle normal({Color? color}) => TextStyle(
    fontSize: 14.0,
    color: color ?? ColorsPalette.foreground,
    fontWeight: FontWeight.w500,
    fontFamily: 'Gotham',
    height: 1.4
  );

  static TextStyle header = TextStyle(
    fontSize: 16.0,
    color: ColorsPalette.foreground,
    fontWeight: FontWeight.w700,
    fontFamily: 'Gotham',
    height: 1.4
  );

  static TextStyle normalThin({Color? color}) => TextStyle(
    fontSize: 14.0,
    color: color ?? ColorsPalette.foreground,
    fontWeight: FontWeight.w300,
    fontFamily: 'Gotham',
    height: 1.4
  );

  static TextStyle smallThin({Color? color}) => TextStyle(
    fontSize: 12.0,
    color: color ?? ColorsPalette.foreground,
    fontWeight: FontWeight.w300,
    fontFamily: 'Gotham',
    height: 1.4
  );

  static TextStyle smallBold({Color? color}) => TextStyle(
    fontSize: 12.0,
    color: color ?? ColorsPalette.foreground,
    fontWeight: FontWeight.bold,
    fontFamily: 'Gotham',
    height: 1.4
  );

  static TextStyle buttonText({Color? color}) => TextStyle(
    fontSize: 16.0,
    color: color ?? ColorsPalette.foreground,
    fontWeight: FontWeight.bold,
    fontFamily: 'Gotham',
    height: 1.4
  );

  static TextStyle sectionTitle({Color? color}) =>TextStyle(
    fontSize: 14.0,
    color: color ?? ColorsPalette.foreground,
    fontWeight: FontWeight.bold,
    fontFamily: 'Gotham',
    height: 1.4
  );
}