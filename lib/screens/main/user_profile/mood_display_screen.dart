// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AllMoodsPage extends StatelessWidget {
  const AllMoodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.pushReplacementNamed(context, '/main', arguments: 3);
          },
        ),
        title: Text(
          'All Mood Tracks',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: ListView(
        children: [
          _buildDateSection(context, '22 Jun'),
          _buildMoodEntry(context, 'Bad', 'assets/icons/anger.png',
              'Jun 22, 2024 - 11:21 PM'),
          _buildMoodEntry(context, 'Bad', 'assets/icons/anger.png',
              'Jun 28, 2024 - 11:18 PM'),
          _buildMoodEntry(context, 'Not Great', 'assets/icons/sad.png',
              'Jun 28, 2024 - 11:18 PM'),
          _buildMoodEntry(context, 'Not Great', 'assets/icons/sad.png',
              'Jun 28, 2024 - 11:18 PM'),
          _buildMoodEntry(context, 'Amazingg', 'assets/icons/happy.png',
              'Jun 28, 2024 - 11:18 PM'),
          _buildDateSection(context, '22 Jun'),
          _buildMoodEntry(context, 'Good', 'assets/icons/surprised.png',
              'Jun 22, 2024 - 11:21 PM'),
        ],
      ),
    );
  }

  Widget _buildDateSection(BuildContext context, String date) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        date,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildMoodEntry(
      BuildContext context, String mood, String icon, String dateTime) {
    return Card(
      color: Color(0xFFF8F2EB),
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: Container(width: 36, height: 36, child: Image.asset(icon)),
        title: Text(
          mood,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        subtitle: Text(dateTime),
      ),
    );
  }
}
