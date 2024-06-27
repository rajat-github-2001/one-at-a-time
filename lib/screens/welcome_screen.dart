import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-0.18, -0.98),
          end: Alignment(0.18, 0.98),
          colors: [
            Color(0xFFD0EEFF),
            Color(0xFFC4ECFB),
            Color(0xFFB9EBF6),
            Color(0xFFAFE9EE),
            Color(0xFFA7E7E4),
            Color(0xFFA2E4D9),
            Color(0xFFA0E1CC),
            Color(0xFFA2DDBE),
            Color(0xFFA6D9AF),
            Color(0xFFADD4A0)
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/images/logo-sample.png',
            width: 150,
            height: 150,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            height: 24,
          ),
          const Text('Welcome to',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF0D1B1E),
                fontWeight: FontWeight.w400,
                fontSize: 30,
                letterSpacing: 1.50,
              )),
          const Text('One Step at a Time',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF0D1B1E),
                fontWeight: FontWeight.w700,
                fontSize: 30,
                letterSpacing: 1.50,
              )),
          const SizedBox(
            height: 24,
          ),
          const Text('Just take a look and take action!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xBF0D1B1E),
                fontWeight: FontWeight.w400,
                fontSize: 18.0,
                letterSpacing: 0.19,
              )),
          const SizedBox(
            height: 209,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              label: const Text(
                'Explore',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0XFF3B3EDE)),
                elevation: MaterialStateProperty.all(5),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                ),
                shadowColor:
                    MaterialStateProperty.all(Colors.black.withOpacity(0.5)),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
