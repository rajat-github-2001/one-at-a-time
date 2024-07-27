import 'package:flutter/material.dart';
import 'package:one_at_a_time/providers/mood_card.dart';
import 'package:one_at_a_time/screens/main/mood_track/mood_screen.dart';
import 'package:one_at_a_time/screens/main/mood_track/mood_track_screen.dart';
import 'package:one_at_a_time/screens/main/user_profile/edit_user_screen.dart';
import 'package:one_at_a_time/screens/main/user_profile/habits_screen.dart';
import 'package:one_at_a_time/screens/main/user_profile/journal_screen.dart';
import 'package:one_at_a_time/screens/main/user_profile/mood_display_screen.dart';
import 'package:one_at_a_time/screens/starting_screen.dart';
import 'package:one_at_a_time/screens/subscription_info.dart';
import 'package:provider/provider.dart';
import './screens/main/todo/todo_screen.dart';
import './screens/onboarding_screen.dart';
import './screens/welcome_screen.dart';
import './screens/authentication/login.dart';
import './screens/authentication/signup.dart';
import 'screens/profile_screen.dart';
import './screens/payment_screen.dart';
import './screens//payment_success_screen.dart';
import './screens/main/meditation/meditation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MoodCard(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        initialRoute: '/',
        routes: {
          '/': (context) => const OnBoardingScreen(),
          '/welcome': (context) => const WelcomeScreen(),
          '/login': (context) => const Login(),
          '/signup': (context) => const SignUp(),
          '/profile': (context) => const ProfileScreen(),
          '/starting': (context) => const StartingScreen(),
          '/main': (context) => const ToDoScreen(),
          '/moodtrack': (context) => const MoodTrackScreen(),
          '/mood': (context) => const MoodScreen(),
          '/edituser': (context) => const EditProfilePage(),
          '/habit': (context) => const AllHabitsPage(),
          '/journal': (context) => const AllJournalsPage(),
          '/moods': (context) => const AllMoodsPage(),
          '/payment': (context) => const PaymentScreen(),
          '/payment-success': (context) => const PaymentSuccessScreen(),
          '/subinfo': (context) => const SubscriptionPage(),
          '/meditation': (context) => const MeditationPage(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Euclid Circular A'),
      ),
    );
  }
}
