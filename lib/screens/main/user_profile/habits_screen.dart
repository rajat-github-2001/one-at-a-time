import 'package:flutter/material.dart';
import 'package:one_at_a_time/screens/main/user_profile/user_profile_screen.dart';

class AllHabitsPage extends StatelessWidget {
  const AllHabitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.pushReplacementNamed(context, '/main', arguments: 3);
          },
        ),
        title: Text(
          'All Habits',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CalendarGrid(
              showStarDates: true,
              showFireDates: false,
              showMoodDates: false,
            ),
            const SizedBox(height: 16),
            buildRecord(context),
          ],
        ),
      ),
    );
  }

  Widget buildRecord(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildRecordRow(context, 'Perfect Days', '4 day'),
            buildRecordRow(context, 'Best Streaks', '0 day'),
            buildRecordRow(context, 'Habit Done Total', '12'),
          ],
        ),
      ),
    );
  }

  Widget buildRecordRow(BuildContext context, title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            value,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
