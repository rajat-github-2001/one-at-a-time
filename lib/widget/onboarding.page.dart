import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const OnBoardingPage({super.key, 
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 300.0,
            width: 300.0,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 55.0,),
          Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF0D1B1E),
            fontWeight: FontWeight.w700,
            fontSize: 30.0,
            letterSpacing: 1.50,
          ),
        ),
        const SizedBox(height: 20.0),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xBF0D1B1E),
            fontWeight: FontWeight.w400,
            fontSize: 18.0,
            letterSpacing: 0.19,
          ),
        ),
        ],
      )
    );
  }
}