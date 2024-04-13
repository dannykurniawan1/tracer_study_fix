import 'package:flutter/material.dart';
import 'package:tracer_study_fix/Screens/splash_screen.dart';
import 'package:tracer_study_fix/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: blue1),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}

