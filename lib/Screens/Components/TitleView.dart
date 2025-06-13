import 'package:flutter/material.dart';

class TitleView extends StatelessWidget {
  final String title;
  final String subtitle;

  const TitleView({Key? key, required this.title, required this.subtitle})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),

        SizedBox(height: MediaQuery.of(context).size.height * 0.001),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
