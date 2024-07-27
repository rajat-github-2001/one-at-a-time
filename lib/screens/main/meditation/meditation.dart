// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MeditationPage extends StatelessWidget {
  const MeditationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/main', arguments: 1),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'What is meditation',
                        style: TextStyle(
                          fontFamily: 'Euclid Circular A',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Meditation is a way to focus your mind',
                        style: TextStyle(
                          fontFamily: 'Euclid Circular A',
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'and find a sense of calm and clarity.',
                        style: TextStyle(
                          fontFamily: 'Euclid Circular A',
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/images/meditation.png', // Add the image to your assets folder and update the path
                    height: 98,
                    width: 103,
                  ),
                ),
              ],
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            MeditationCard(
              title: 'Welcome',
              subtitle: 'Find your inner peace',
              duration: 'assets/icons/two.png',
              color: Color(0xFFFFF9C4),
              imagePath: 'assets/images/welcome.png',
            ),
            SizedBox(
              height: 20,
            ),
            MeditationCard(
              title: 'Harmony',
              subtitle: 'Balance mind and body',
              duration: 'assets/icons/three.png',
              color: Color(0xFFFFE0B2), // Color for orange[100]
              imagePath: 'assets/images/harmony.png',
            ),
            SizedBox(
              height: 20,
            ),
            MeditationCard(
              title: 'Serenity',
              subtitle: 'Find peace in nature',
              duration: 'assets/icons/three.png',
              color: Color(0xFFC8E6C9), // Color for green[100]
              imagePath: 'assets/images/serenity.png',
            ),
            SizedBox(
              height: 20,
            ),
            MeditationCard(
              title: 'Stillness',
              subtitle: 'Quiet your thoughts',
              duration: 'assets/icons/two.png',
              color: Color(0xFFF8BBD0), // Color for pink[100]
              imagePath: 'assets/images/stillness.png',
            ),
          ],
        ),
      ),
    );
  }
}

class MeditationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String duration;
  final Color color;
  final String imagePath;

  MeditationCard({
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.color,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.pushNamed(context, '/meditation'),
      child: Container(
        width: 358,
        height: 156,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.asset(
                        'assets/icons/play.png',
                        width: 48,
                        height: 21,
                      ),
                    ),
                    Image.asset(
                      duration,
                      width: 40,
                      height: 16,
                    ),
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
              ],
            ),
            Spacer(),
            Image.asset(
              imagePath,
              width: 96,
              height: 96,
            ),
          ],
        ),
      ),
    );
  }
}
