import 'package:flutter/material.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0E3EDB1),
      body: Center(
        child: Image.asset('assets/images/launch_and_splash_screen/splash.jpg'),
      ),
    );
  }
}
