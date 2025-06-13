import 'package:flutter/material.dart';

class FormElement extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final TextEditingController emailController;
  final Widget? suffixIcon;
  final String? Function(String?) validatorFunc;
  final bool? obText;

  const FormElement({
    Key? key,
    required this.labelText,
    required this.icon,
    required this.emailController,
    this.suffixIcon,
    required this.validatorFunc,
    this.obText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.95,
      child: TextFormField(
        obscureText: obText ?? false,
        controller: emailController,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.blueGrey),
          ),
          prefixIcon: Icon(icon),
          suffixIcon: suffixIcon != null ? (suffixIcon) : null,
        ),
        validator: validatorFunc,
      ),
    );
  }
}
