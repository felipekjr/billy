import 'package:flutter/material.dart';
import './text_styles.dart';
import './colors_palette.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? action;
  final double? height;
  final String title;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.height,
    this.action,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height ?? 50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: ColorsPalette.foreground),
        onPressed: () => Navigator.of(context).pop(),
      ), 
      backgroundColor: ColorsPalette.black2,
      elevation: 0,
      title: Text(title, style: TextStyles.header),
    );
  }
}