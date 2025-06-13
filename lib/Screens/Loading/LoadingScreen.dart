
import 'package:flutter/cupertino.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';

class Loadingscreen extends StatelessWidget {
  const Loadingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LoadingAnimationWidget.discreteCircle(
              color: Theme.of(context).colorScheme.primary,
              secondRingColor: Theme.of(context).colorScheme.secondary,
              size: 150,
            ),
            SizedBox(height:32.0,),
            Text("Please Wait...", style: Theme.of(context).textTheme.titleLarge,)
          ],
        ),
      ),
    );
  }
}