import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        LottieBuilder.asset(
          'assets/Login.json',
          height: 250,
          width: 250,
          repeat: false,
          animate: true,
          reverse: false,
        ),
      ],
    );
  }
}
