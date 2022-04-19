import 'package:flutter/material.dart';
import './text_styles.dart';
import './colors_palette.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? action;
  final double? height;
  final TabBar? tabBar;
  final String title;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.tabBar,
    this.height,
    this.action,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height ?? 50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.close, color: ColorsPalette.foreground),
        onPressed: () => Navigator.of(context).pop(),
      ), 
      actions: action != null ? [
        action!
      ] : [],
      bottom: tabBar,
      backgroundColor: ColorsPalette.black2,
      elevation: 0,
      title: Text(title, style: TextStyles.header),
    );
  }
}