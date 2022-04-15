import 'package:flutter/material.dart';
import '../layout/layout.dart';

class ErrorOverlay extends StatelessWidget {
  final FlutterErrorDetails details;

  const ErrorOverlay({ Key? key, required this.details }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: ColorsPalette.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                details.exception.toString(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              )
          ])
        ),
      ),
    );
  }
}