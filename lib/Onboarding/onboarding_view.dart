import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tracer_study_fix/Onboarding/onboarding_items.dart';
import 'package:tracer_study_fix/theme.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void skipToLastPage() {
    _pageController.jumpToPage(demoData.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _pageIndex = index;
                        });
                      },
                      itemCount: demoData.length,
                      itemBuilder: (context, index) => OnboardContent(
                        image: demoData[index].image,
                        title: demoData[index].title,
                        description: demoData[index].description,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      ...List.generate(
                        demoData.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(right: 4),
                          child: DotIndicator(isActive: index == _pageIndex),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            _pageController.nextPage(
                              curve: Curves.ease,
                              duration: const Duration(milliseconds: 300),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: blue1,
                            shape: const CircleBorder(),
                          ),
                          child: SvgPicture.asset(
                            'assets/svg/Vector1.svg',
                            height: 30,
                            width: 30,
                            colorFilter:
                                ColorFilter.mode(dark4, BlendMode.srcIn),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: TextButton(
                onPressed: skipToLastPage,
                child: Text('Lewati', style: TextStyle(color: blue1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
        color: isActive ? blue1 : dark3,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}


class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 250,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: bold28,
        ),
        const SizedBox(height: 10),
        Text(
          description,
          textAlign: TextAlign.center,
          style: regular16,
        ),
        const Spacer(),
      ],
    );
  }
}
