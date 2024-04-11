import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              'assets/images/onboarding1.png',
              height: 250,
            ),
            Text('Pemberitahuan',style: Theme.of(context)
            .textTheme.headline5!.copyWith(fontWeight: FontWeight.w500),)
          ],
        ),
      ),
    );
  }
}
