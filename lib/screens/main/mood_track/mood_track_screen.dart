// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:one_at_a_time/providers/mood_card.dart';
import 'package:provider/provider.dart';

class MoodTrackScreen extends StatefulWidget {
  const MoodTrackScreen({super.key});

  @override
  State<MoodTrackScreen> createState() => _MoodTrackScreenState();
}

class _MoodTrackScreenState extends State<MoodTrackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 26.0, left: 25.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 26,
            ),
            Text(
              'With love, for self',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 30),
            MotivationCard(),
            SizedBox(height: 30),
            FeelingSection(),
          ],
        ),
      ),
    );
  }
}

class MotivationCard extends StatelessWidget {
  const MotivationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358,
      height: 178,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/images/bg.png'), // Replace with your background image path
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Motivation',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              'I am a magnet for positivity and blessings.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                padding: EdgeInsets.all(0),
                icon: Image.asset('assets/mood_icons/paint.png'),
                onPressed: () {},
              ),
              IconButton(
                padding: EdgeInsets.all(0),
                icon: Image.asset('assets/mood_icons/share.png'),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FeelingSection extends StatefulWidget {
  const FeelingSection({
    super.key,
  });

  @override
  State<FeelingSection> createState() => _FeelingSectionState();
}

class _FeelingSectionState extends State<FeelingSection> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MoodCard>(
      builder: (context, moodCard, child) {
        final isUpdated = context.watch<MoodCard>().isUpdated;
        final updatedText = context.watch<MoodCard>().updatedText;

        return GestureDetector(
          onTap: () => {
            Navigator.pushReplacementNamed(context, '/mood'),
          },
          child: isUpdated ? updatedContent(updatedText) : initialContent(),
        );
      },
    );
  }

  Widget initialContent() {
    return Container(
      width: 358,
      height: 94,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Color(0xFFF3D8C7), // Using hex code with alpha
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'How do you feel?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Tap to share'),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Image.asset(
                  'assets/icons/emojicons.png',
                  width: 132,
                  height: 32,
                ), // Adjust width as needed
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget updatedContent(String text) {
    return Container(
      width: 358,
      height: 143, // Adjust this value if needed to match the image
      // margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-0.99, 0.14), // Approximately 82 degrees
          end: Alignment(0.99, -0.14),
          colors: [
            Color.fromRGBO(255, 236, 7, 0.30),
            Color.fromRGBO(243, 199, 212, 0.30),
            Color.fromRGBO(173, 212, 160, 0.30),
            Color.fromRGBO(219, 66, 47, 0.30),
          ],
          stops: [0.0, 0.3513, 0.6803, 1.0771],
        ), // Light yellow color, adjust if needed
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 4),
            Center(
              child: Text(
                'Tap to share more.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
