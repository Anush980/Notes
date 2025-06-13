import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:notes/components/FormElement.dart';

class EmailInput extends StatelessWidget {
  EmailInput({super.key, required this.emailController});

  final TextEditingController emailController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormElement(
          labelText: "Email",
          icon: Icons.email,
          emailController: emailController,
          validatorFunc: (value) {
            if (value == null || value.isEmpty) {
              return 'Email is required';
            } else if (!EmailValidator.validate(value)) {
              return 'Enter a valid email address';
            }
            return null;
          },
        ),
      ],
    );
  }
}
