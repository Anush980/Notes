import 'package:flutter/material.dart';

class ButtonView extends StatefulWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color backgroundColor;

  ButtonView({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    this.backgroundColor = Colors.blueAccent,
  }) : super(key: key);

  @override
  _ButtonViewState createState() => _ButtonViewState();
}

class _ButtonViewState extends State<ButtonView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.backgroundColor,
            minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
          ),
          child: Text(
            widget.buttonText,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
