import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'Home.dart';
class SplashScreen extends StatelessWidget {
  static String routeName = '/splash_screen';

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/splash.png',
      nextScreen: HomeScreen(),
      splashTransition: SplashTransition.rotationTransition,
    );

  }
}
