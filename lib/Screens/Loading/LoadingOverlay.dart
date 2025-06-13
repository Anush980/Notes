
import 'package:flutter/material.dart';
import 'package:notes/Screens/Loading/LoadingScreen.dart';
import 'package:notes/Screens/Loading/LoadingService.dart';
class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: LoadingService.isLoading,
      builder: (context, loading, child) {
        return loading
            ? const Positioned.fill(child: Loadingscreen())
            : const SizedBox.shrink();
      },
    );
  }
}