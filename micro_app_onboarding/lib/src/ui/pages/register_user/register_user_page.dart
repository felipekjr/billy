import 'package:flutter/material.dart';
import 'package:micro_commons_design_system/micro_commons_design_system.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({ Key? key }) : super(key: key);

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Cadastro',
      ),
      body: Column(
        children: [
        ]
      ),
    );
  }
}