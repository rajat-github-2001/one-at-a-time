// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'mood_description_screen.dart';
import 'package:one_at_a_time/widget/finish_dialog.dart';

class MoodScreen extends StatefulWidget {
  const MoodScreen({super.key});

  @override
  State<MoodScreen> createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  String? _selectedMood;
  String? _mood;
  MoodData? _selectedMoodData;

  void _onMoodSelected(String text, MoodData moodData, String mood) {
    setState(() {
      _selectedMood = text; //This is the mood text
      _selectedMoodData = moodData; //This is the mood data.
      _mood =
          mood; //This helps to populate elevated button with the moods respective text.
    });
  }

  void _onButtonPressed() {
    if (_selectedMoodData != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              MoodDescriptionScreen(moodData: _selectedMoodData!),
        ),
      );
    }
  }

  Widget _buildMoodButton(
      String text, String assetPath, MoodData moodData, String mood) {
    return GestureDetector(
      onTap: () => _onMoodSelected(text, moodData, mood),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 90,
                height: 90,
                child: Center(
                  child: Image.asset(
                    assetPath,
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
              if (_selectedMood == text)
                Positioned(
                  bottom: 5,
                  right: 0,
                  child: Image.asset('assets/icons/done.png'),
                ),
            ],
          ),
          SizedBox(height: 10),
          Text(text),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String buttonText = 'Select a mood';

    if (_mood == 'happy') {
      buttonText = 'I feel amazingg!!';
    } else if (_mood == 'surprised') {
      buttonText = 'I feel goodish!';
    } else if (_mood == 'sad') {
      buttonText = 'I feel ok, not great.';
    } else if (_mood == 'anger') {
      buttonText = 'I feel bad...';
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // IconButton(
                  //   icon: Icon(Icons.arrow_back),
                  //   onPressed: () {
                  //     Navigator.pop(context);
                  //   },
                  // ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      showFinishDialog(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: 40),
              Text(
                'How are you\nfeeling?',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildMoodButton('Amazingg', 'assets/icons/happy.png',
                      happyMoodData, 'happy'),
                  _buildMoodButton('Good', 'assets/icons/surprised.png',
                      surprisedMoodData, 'surprised'),
                ],
              ),
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildMoodButton(
                      'Not Great', 'assets/icons/sad.png', sadMoodData, 'sad'),
                  _buildMoodButton(
                      'Bad', 'assets/icons/anger.png', angerMoodData, 'anger'),
                ],
              ),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _selectedMood == null ? Colors.grey : Color(0XFF3B3EDE),
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: _selectedMood == null ? null : _onButtonPressed,
                child: Text(
                  buttonText,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class MoodData {
  final List<String> description;
  final String title;
  final String assetPath;
  final Color backgroundColor;
  final Color selectedColor;
  final String shareQuestion;
  final String text;

  MoodData(
      {required this.description,
      required this.assetPath,
      required this.backgroundColor,
      required this.selectedColor,
      required this.shareQuestion,
      required this.title,
      required this.text});
}

final MoodData happyMoodData = MoodData(
    title: 'Amazing',
    description: [
      'Relaxed',
      'Energetic',
      'Confident',
      'Brave',
      'Grateful',
      'Peaceful',
      'Proud',
      'Inspired',
      'Hopeful',
      'Loved'
    ],
    assetPath: 'assets/icons/happy.png',
    backgroundColor: Color.fromARGB(255, 255, 248, 157),
    selectedColor: Color(0xFFFFEC07),
    shareQuestion: 'Share what\'s bringing you amazing feelings!',
    text: 'Keep doing amazing!');

final MoodData surprisedMoodData = MoodData(
    title: 'Good',
    description: [
      'Comfortable',
      'Hopeful',
      'Jolly',
      'Relieved',
      'Calm',
      'Appreciated',
      'Lovely',
      'Accepting',
      'Excited',
      'Untroubled'
    ],
    assetPath: 'assets/icons/surprised.png',
    backgroundColor: Color(0xFFFEEDF3),
    selectedColor: Color(0xFFF3C7D4),
    shareQuestion: 'What\'s going good in your life? Share them..',
    text: 'Better days ahead');

final MoodData sadMoodData = MoodData(
  title: 'Not Great',
  description: [
    'Confused',
    'Frustrated',
    'Tired',
    'Anxious',
    'Discouraged',
    'Tense',
    'Stressed',
    'Overwhelmed',
    'Fine',
    'Irritated'
  ],
  assetPath: 'assets/icons/sad.png',
  backgroundColor: Color(0xFFE9F8E4),
  selectedColor: Color(0xFFADD4A0),
  shareQuestion: 'Understood. What\'s making you feel not great?',
  text: 'You\'ve got this!!',
);

final MoodData angerMoodData = MoodData(
    title: 'Bad',
    description: [
      'Hurt',
      'Disrespected',
      'Anxious',
      'Lonely',
      'Unimportant',
      'Scared',
      'Let Down',
      'Sad',
      'Miserable',
      'Angry'
    ],
    assetPath: 'assets/icons/anger.png',
    backgroundColor: Color(0xFFF8DCD7),
    selectedColor: Color(0xFFFF806D),
    shareQuestion: 'Sorry you feel that way. What\'s causing you trouble?',
    text: 'You deserve the best! <3');
