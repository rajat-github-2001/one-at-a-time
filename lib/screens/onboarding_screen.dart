//import 'dart:js_interop';

import 'package:flutter/material.dart';
import '../widget/onboarding.page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  final List<OnBoardingPage> _pages = [
    const OnBoardingPage(
        title: 'Keep calm, be aware and focused',
        description:
            'Reflect your daily acts and build habits that are one step closer to your goal.',
        imagePath: 'assets/images/onboarding-1.png'),
    const OnBoardingPage(
        title: 'Get your things done with less rush',
        description:
            'Plan your days in details and achieve them one step at a time.',
        imagePath: 'assets/images/onboarding-2.png'),
    const OnBoardingPage(
        title: 'Exercise more & breathe better',
        description:
            'Learn, measure and practise self-love with gratitude and compassion. ',
        imagePath: 'assets/images/onboarding-3.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0XFFD0EEFF),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
                itemBuilder: (context, index) => _pages[index],
              ),
            ),
            _buildNextButton(),
            const SizedBox(height: 20.0),
            _buildIndicator(),
            const SizedBox(height: 100.0),
          ],
        ));
  }

  Widget _buildIndicator() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _pages.map((page) {
          int index = _pages.indexOf(page);
          return Container(
            margin: const EdgeInsets.all(5),
            width: 85,
            height: 4,
            decoration: BoxDecoration(
              color: index <= _currentPageIndex
                  ? const Color(0XFF3B3EDE)
                  : Colors.white,
            ),
          );
        }).toList());
  }

  Widget _buildNextButton() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ElevatedButton.icon(
          onPressed: _currentPageIndex < _pages.length - 1
              ? _nextPage
              : _navigateToNextPage,
          icon: const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
          label: const Text(
            'Next',
            style: TextStyle(color: Colors.white),
          ),
          style: TextButton.styleFrom(
              backgroundColor: const Color(0XFF3B3EDE),
              elevation: 5,
              padding: const EdgeInsets.all(20),
              shadowColor: Colors.black.withOpacity(0.5)),
        ));
  }

  void _nextPage() {
    if (_currentPageIndex < _pages.length - 1) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  void _navigateToNextPage() {
    Navigator.pushReplacementNamed(context, '/welcome');
  }
}
