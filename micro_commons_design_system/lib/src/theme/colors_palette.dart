import 'package:flutter/widgets.dart';

class ColorsPalette {
  static LinearGradient logoGradient = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xff89FF85),
      Color(0xff80FFE4), 
    ],
  );

  static LinearGradient gradient = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xff80FFE4), 
      Color(0xff89FF85),
    ],
  );

  static Color black = const Color(0xff282A36);
  static Color black2 = const Color(0xff333541);
  static Color currentLine = const Color(0xff525461);
  static Color foreground = const Color(0xffF8F8F2);
  static Color green = const Color(0xff50FA7B);
  static Color red = const Color(0xffFF5555);
  static Color cyan = const Color(0xff8BE9FD);
  static Color yellow = const Color(0xfff1fa8c);
  static Color purple = const Color(0xffbd93f9);
  static Color pink = const Color(0xffff79c6);
  static Color comment = const Color(0xff6272a4);
}