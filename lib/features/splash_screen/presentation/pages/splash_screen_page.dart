import 'package:flutter/material.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  static const String routeName = '/splash_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SplashScreen')),
      body: const Center(child: Text('SplashScreen Page')),
    );
  }
}
