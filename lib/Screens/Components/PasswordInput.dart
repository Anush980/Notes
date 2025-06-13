import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:notes/Screens/Components/FormElement.dart';

class Passwordinput extends StatelessWidget {
  Passwordinput({
    super.key,
    required this.validatorFunc,
    this.suffixIcon,
    this.obText,
    required this.passwordController,
    required this.text,
  });
  final TextEditingController passwordController;
  final String? Function(String?) validatorFunc;
  final Widget? suffixIcon;
  final bool? obText;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormElement(
          obText: obText,
          labelText: text,
          icon: Icons.lock,
          emailController: passwordController,
          validatorFunc: validatorFunc,
          suffixIcon: suffixIcon,
        ),
      ],
    );
  }
}
