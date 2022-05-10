import 'package:flutter/material.dart';
import 'package:micro_app_onboarding/src/presentation/helpers/helpers.dart';
import 'package:micro_commons_design_system/micro_commons_design_system.dart';

class BasePageWidget extends StatefulWidget {
  final String title;
  final List<Widget> children;
  final ValueNotifier<UIState> state;
  final VoidCallback onError;
  final Function(String) onSuccess;

  const BasePageWidget({ 
    Key? key,
    required this.title,
    required this.children,
    required this.state,
    required this.onError,
    required this.onSuccess
  }) : super(key: key);

  @override
  State<BasePageWidget> createState() => _BasePageWidgetState();
}

class _BasePageWidgetState extends State<BasePageWidget> {
  @override
  void initState() {
    widget.state.addListener(() {
      final state = widget.state.value;
      if (state is UIErrorState) widget.onError();
      if (state is UISuccessState) widget.onSuccess(state.description);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.title,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height * .85),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Spacing.x4,
                horizontal: Spacing.x3
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: widget.children
              ),
            ),
          ),
        ),
      )
    );
  }
}