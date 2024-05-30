import 'package:flutter/material.dart';
import './screens/onboarding_screen.dart';
import './screens/welcome_screen.dart';
import './screens/authentication/login.dart';
import './screens/authentication/signup.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => OnBoardingScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => Login(),
        '/signup': (context) => SignUp(),
        '/profile': (context) => ProfileScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Euclid Circular A'
      ),
    );
  }
}
