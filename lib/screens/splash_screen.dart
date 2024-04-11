import 'package:flutter/material.dart';
import 'dart:async';

import 'package:tracer_study_fix/Onboarding/onboarding_view.dart';
 // Pastikan Anda mengimpor OnboardingView

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnboardingView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/splash screen.png',),
          Text('Splash Screen'),
        ],
      ),
    );
  }
}
