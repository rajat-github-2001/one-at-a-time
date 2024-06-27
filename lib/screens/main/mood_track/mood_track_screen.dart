import 'package:flutter/material.dart';
import './mood_selector.dart';

class MoodTrackScreen extends StatefulWidget {
  const MoodTrackScreen({super.key});

  @override
  State<MoodTrackScreen> createState() => _MoodTrackScreenState();
}

class _MoodTrackScreenState extends State<MoodTrackScreen> {
  String? _selectedEmoji;

  void _showMoodDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 16.0,
          ),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.close, color: Colors.grey),
                      ),
                    ),
                    Text(
                      'Affirm Your Ability',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "No matter how I move, I'm proud to be here and I'm grateful for the ability to do so.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'How do you feel?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 16),
                    MoodSelector(
                      onMoodSelected: (emoji) {
                        setState(() {
                          _selectedEmoji = emoji;
                        });
                      },
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(color: Color(0XFF3B3EDE)),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Reflect Back',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0XFF3B3EDE),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Continue',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  right: 130,
                  top: 20,
                  child: Image.asset('assets/icons/star.png'),
                ),
                Positioned(
                  right: 160,
                  top: 10,
                  width: 16,
                  height: 16,
                  child: Image.asset('assets/icons/star.png'),
                ),
                Positioned(
                  right: 150,
                  top: 50,
                  width: 16,
                  height: 16,
                  child: Image.asset('assets/icons/star.png'),
                ),
                Positioned(
                  right: 130,
                  bottom: 30,
                  child: Image.asset('assets/icons/star.png'),
                ),
                Positioned(
                  right: 160,
                  bottom: 20,
                  width: 16,
                  height: 16,
                  child: Image.asset('assets/icons/star.png'),
                ),
                Positioned(
                  right: 150,
                  bottom: 60,
                  width: 16,
                  height: 16,
                  child: Image.asset('assets/icons/star.png'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: _showMoodDialog,
        child: Text('Track your mood'),
      ),
    );
  }
}
