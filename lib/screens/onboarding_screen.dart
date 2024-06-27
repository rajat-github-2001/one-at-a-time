import 'dart:js_interop';

import 'package:flutter/material.dart';
import '../widget/onboarding.page.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _pageController = PageController();
  int _currentPageIndex = 0;

  final List<OnBoardingPage> _pages = [
    OnBoardingPage(
        title: 'Keep calm, be aware and focused',
        description:
            'Reflect your daily acts and build habits that are one step closer to your goal.',
        imagePath: 'assets/images/onboarding-1.png'),
    OnBoardingPage(
        title: 'Get your things done with less rush',
        description:
            'Plan your days in details and achieve them one step at a time.',
        imagePath: 'assets/images/onboarding-2.png'),
    OnBoardingPage(
        title: 'Exercise more & breathe better',
        description:
            'Learn, measure and practise self-love with gratitude and compassion. ',
        imagePath: 'assets/images/onboarding-3.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFD0EEFF),
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
            SizedBox(height: 20.0),
            _buildIndicator(),
            SizedBox(height: 100.0),
          ],
        ));
  }

  Widget _buildIndicator() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _pages.map((page) {
          int index = _pages.indexOf(page);
          return Container(
            margin: EdgeInsets.all(5),
            width: 85,
            height: 4,
            decoration: BoxDecoration(
              color: index <=_currentPageIndex ? Color(0XFF3B3EDE) : Colors.white,
            ),
          );
        }).toList());
  }

  Widget _buildNextButton() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: ElevatedButton.icon(
          onPressed: _currentPageIndex < _pages.length - 1 ? _nextPage : _navigateToNextPage,
          icon: Icon(
            Icons.arrow_forward,
            color: Colors.white,
            ),
          label: Text(
            'Next',
            style: TextStyle(
              color: Colors.white
            ),
            ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0XFF3B3EDE)),
            elevation: MaterialStateProperty.all(5),
            padding: MaterialStateProperty.all(EdgeInsets.all(20)),
            shadowColor: MaterialStateProperty.all(Colors.black.withOpacity(0.5))
          ),
        ));
  }

  void _nextPage() {
    if (_currentPageIndex < _pages.length - 1) {
      _pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  void _navigateToNextPage() {
    Navigator.pushReplacementNamed(context, '/welcome');
  }
}
