import 'package:flutter/material.dart';

class AccountPrompt extends StatelessWidget {
  final VoidCallback onLoginTap;
  final String promptText;
  final String actionText;
  final Color actionTextColor;

  const AccountPrompt({
    Key? key,
    required this.onLoginTap,
    this.promptText = 'Have an Account Already? ',
    this.actionText = 'Login',
    this.actionTextColor = Colors.deepPurple,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(promptText),
        GestureDetector(
          onTap: onLoginTap,
          child: Text(actionText, style: TextStyle(color: actionTextColor)),
        ),
      ],
    );
  }
}
