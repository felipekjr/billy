import 'package:flutter/widgets.dart';
import './colors_palette.dart';

class TextStyles {
  static TextStyle title({Color? color}) => TextStyle(
    fontSize: 22.0,
    color: color ?? ColorsPalette.foreground,
    fontWeight: FontWeight.bold,
  );

  static TextStyle normal({Color? color}) => TextStyle(
    fontSize: 16.0,
    color: color ?? ColorsPalette.foreground,
    fontWeight: FontWeight.normal,
  );

  static TextStyle normalBold({Color? color}) => TextStyle(
    fontSize: 16.0,
    color: color ?? ColorsPalette.foreground,
    fontWeight: FontWeight.bold,
  );

  static TextStyle medium({Color? color}) => TextStyle(
    fontSize: 18.0,
    color: color ?? ColorsPalette.foreground,
    fontWeight: FontWeight.w500,
  );
  
  static TextStyle header = TextStyle(
    fontSize: 20.0,
    color: ColorsPalette.foreground,
    fontWeight: FontWeight.w700,
  );

  static TextStyle normalThin({Color? color}) => TextStyle(
    fontSize: 16.0,
    color: color ?? ColorsPalette.foreground,
    fontWeight: FontWeight.w300,
  );

  static TextStyle small({Color? color}) => TextStyle(
    fontSize: 12.0,
    color: color ?? ColorsPalette.foreground,
    fontWeight: FontWeight.w500,
  );

  static TextStyle smallThin({Color? color}) => TextStyle(
    fontSize: 12.0,
    color: color ?? ColorsPalette.foreground,
    fontWeight: FontWeight.w300,
  );

  static TextStyle smallBold({Color? color}) => TextStyle(
    fontSize: 12.0,
    color: color ?? ColorsPalette.foreground,
    fontWeight: FontWeight.bold,
  );

  static TextStyle buttonText({Color? color}) => TextStyle(
    fontSize: 16.0,
    color: color ?? ColorsPalette.foreground,
    fontWeight: FontWeight.bold,
  );

  static TextStyle sectionTitle({Color? color}) =>TextStyle(
    fontSize: 20.0,
    color: color ?? ColorsPalette.foreground,
    fontWeight: FontWeight.bold,
  );
}