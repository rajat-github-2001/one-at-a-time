// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:one_at_a_time/providers/mood_card.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'mood_screen.dart';
import 'package:one_at_a_time/widget/finish_dialog.dart';

class MoodDescriptionScreen extends StatefulWidget {
  final MoodData moodData;
  const MoodDescriptionScreen({required this.moodData, super.key});

  @override
  State<MoodDescriptionScreen> createState() => _MoodDescriptionScreenState();
}

class _MoodDescriptionScreenState extends State<MoodDescriptionScreen> {
  final Set<String> _selectedMoods = {};

  void _onMoodButtonPressed(String mood) {
    setState(() {
      if (_selectedMoods.contains(mood)) {
        _selectedMoods.remove(mood);
      } else {
        _selectedMoods.add(mood);
      }
    });
  }

  void _onButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MoodReasonScreen(moodData: widget.moodData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.moodData.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      showFinishDialog(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 100,
                height: 100,
                child: Center(child: Image.asset(widget.moodData.assetPath)),
              ),
              SizedBox(height: 20),
              Text(
                'How would you describe you?',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Expanded(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: widget.moodData.description.map((mood) {
                    final bool isSelected = _selectedMoods.contains(mood);
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ChoiceChip(
                        label: Text(mood),
                        selected: isSelected,
                        onSelected: (selected) {
                          _onMoodButtonPressed(mood);
                        },
                        selectedColor: widget.moodData.selectedColor,
                        backgroundColor: Colors.transparent,
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _selectedMoods.isEmpty ? Colors.grey : Color(0xFF4B4BDD),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _selectedMoods.isEmpty ? null : _onButtonPressed,
                child: Text(
                  'I feel these..',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MoodReasonScreen extends StatefulWidget {
  final MoodData moodData;

  const MoodReasonScreen({super.key, required this.moodData});

  @override
  State<MoodReasonScreen> createState() => _MoodReasonScreenState();
}

class _MoodReasonScreenState extends State<MoodReasonScreen> {
  Set<String> selectedItems = {};
  final storage = FlutterSecureStorage();

  void _onButtonPressed() async {
    try {
      // Retrieve auth token from secure storage
      final authToken = await storage.read(key: 'authToken');
      if (authToken == null) {
        throw Exception('No authToken found');
      }

      context.read<MoodCard>().updateMood();
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.pushReplacementNamed(context, '/main', arguments: 1);
      updateMoodCardText(widget.moodData.text);

      // Prepare data to be sent
      final dataFill = {
        "data": {
          'moodStatus': widget.moodData.title,
          'moodIconUrl': widget.moodData.assetPath,
          'trackedDate': DateTime.now().toIso8601String(),
          // Add more data fields as needed
        }
      };

      final data = jsonEncode(dataFill);

      print("data: $data");

      // Send data to Strapi backend with authentication headers
      final response = await http.post(
        Uri.parse('http://localhost:1337/api/moods'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authToken', // Include auth token in headers
        },
        body: data,
      );

      if (response.statusCode == 200) {
        // Request was successful
        print('Data sent successfully');
      } else {
        // There was an error
        print('Failed to send data: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error occurred while sending data: $e');
    }
  }

  void updateMoodCardText(String moodData) {
    context.read<MoodCard>().updateMoodText(moodData);
  }

  final List<Map<String, dynamic>> items = [
    {
      'icon': 'assets/mood_icons/family.png',
      'label': 'Family',
    },
    {
      'icon': 'assets/mood_icons/bondings.png',
      'label': 'Bondings',
    },
    {
      'icon': 'assets/mood_icons/finances.png',
      'label': 'Finances',
    },
    {
      'icon': 'assets/mood_icons/fitness.png',
      'label': 'Fitness',
    },
    {
      'icon': 'assets/mood_icons/work.png',
      'label': 'Work',
    },
    {
      'icon': 'assets/mood_icons/health.png',
      'label': 'Health',
    },
    {
      'icon': 'assets/mood_icons/sleep.png',
      'label': 'Sleep',
    },
    {
      'icon': 'assets/mood_icons/school.png',
      'label': 'School',
    },
    {
      'icon': 'assets/mood_icons/food.png',
      'label': 'Food',
    },
    {
      'icon': 'assets/mood_icons/nature.png',
      'label': 'Nature',
    },
    {
      'icon': 'assets/mood_icons/hobby.png',
      'label': 'Hobby',
    },
    {
      'icon': 'assets/mood_icons/news.png',
      'label': 'News',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.moodData.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      showFinishDialog(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                widget.moodData.shareQuestion,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    final isSelected = selectedItems.contains(item['label']);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedItems.remove(item['label']);
                          } else {
                            selectedItems.add(item['label']);
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected
                              ? widget.moodData.selectedColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(item['icon']),
                            SizedBox(height: 5),
                            Text(item['label'], style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Add Note',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      selectedItems.isEmpty ? Colors.grey : Color(0xFF4B4BDD),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: selectedItems.isEmpty ? null : _onButtonPressed,
                child: Text(
                  'Because of this.',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
