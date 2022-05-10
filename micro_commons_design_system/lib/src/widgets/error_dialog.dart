import 'package:flutter/material.dart';
import 'package:micro_commons_design_system/micro_commons_design_system.dart';

class ErrorDialog extends StatelessWidget {
  final String message;

  const ErrorDialog({ 
    Key? key,
    required this.message
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ColorsPalette.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Container(
        constraints: const BoxConstraints(maxHeight: 200, minHeight: 200),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            Spacing.x2,
            Spacing.x3,
            Spacing.x2,
            Spacing.x1,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Atenção!', style: TextStyles.sectionTitle()),
              Text(message, style: TextStyles.normalThin()),
              TextButton(
                onPressed: () => Navigator.pop(context), 
                child: Text(
                  'Cancelar', 
                  style: TextStyles.normal(color: ColorsPalette.foreground),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}