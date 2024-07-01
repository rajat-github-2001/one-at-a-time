// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Profile',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Habit Stat',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/habit');
                  },
                  child: Row(
                    children: [
                      Text('View All',
                          style: Theme.of(context).textTheme.bodySmall),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            StatWidget(
              showFireDates: false,
              showStarDates: true,
              showMoodDates: false,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                  child: Text(
                    'Mood Stat',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/moods');
                  },
                  child: Row(
                    children: [
                      Text('View All',
                          style: Theme.of(context).textTheme.bodySmall),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            StatWidget(
              showFireDates: false,
              showStarDates: false,
              showMoodDates: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                  child: Text(
                    'Journal Stat',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/journal');
                  },
                  child: Row(
                    children: [
                      Text('View All',
                          style: Theme.of(context).textTheme.bodySmall),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            StatWidget(
              showFireDates: true,
              showStarDates: false,
              showMoodDates: false,
            ),
            SettingsSection(),
          ],
        ),
      ),
    );
  }
}

class StatWidget extends StatelessWidget {
  final bool showStarDates;
  final bool showFireDates;
  final bool showMoodDates;
  const StatWidget(
      {super.key,
      required this.showFireDates,
      required this.showStarDates,
      required this.showMoodDates});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.chevron_left),
                onPressed: () => {},
              ),
              Text('Jun 2024',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
              IconButton(
                icon: Icon(Icons.chevron_right),
                onPressed: () => {},
              ),
            ],
          ),
          CalendarGrid(
            showFireDates: showFireDates,
            showStarDates: showStarDates,
            showMoodDates: showMoodDates,
          ),
        ],
      ),
    );
  }
}

class CalendarGrid extends StatelessWidget {
  final bool showStarDates;
  final bool showFireDates;
  final bool showMoodDates;

  CalendarGrid(
      {super.key,
      required this.showStarDates,
      required this.showFireDates,
      required this.showMoodDates});

  final List<String> daysOfWeek = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
  ];

  final List<int> starDates = [2, 12, 21, 29];
  final List<int> fireDates = [7, 14, 15, 16, 17];
  final Map<int, Image> moodDates = {
    9: Image.asset('assets/icons/surprised.png'),
    12: Image.asset('assets/icons/happy.png'),
    20: Image.asset('assets/icons/anger.png'),
    23: Image.asset('assets/icons/sad.png'),
  };

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
      ),
      itemCount: daysOfWeek.length + 31, // Adding 7 for the days of the week
      itemBuilder: (context, index) {
        if (index < daysOfWeek.length) {
          // Header row
          return Center(
            child: Text(
              daysOfWeek[index],
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          );
        } else {
          int day = index - daysOfWeek.length + 1;
          bool isStarDate = showStarDates && starDates.contains(day);
          bool isFireDate = showFireDates && fireDates.contains(day);
          bool isMoodDate = showMoodDates && moodDates.containsKey(day);
          Image? moodImage;

          if (isMoodDate) {
            moodImage = moodDates[day];
          }
          // Calendar days
          return Center(
            child: isStarDate
                ? Image.asset('assets/icons/fluent_star.png')
                : isFireDate
                    ? Image.asset('assets/icons/fire.png')
                    : isMoodDate
                        ? Container(width: 32, height: 32, child: moodImage)
                        : Text(
                            '$day',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
          );
        }
      },
    );
  }
}

class SettingsSection extends StatefulWidget {
  const SettingsSection({super.key});
  @override
  State<SettingsSection> createState() => _SettingsSectionState();
}

class _SettingsSectionState extends State<SettingsSection> {
  bool _notificationStatus = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            title: Text(
          'Settings',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        )),
        ListTile(
          title: Text(
            'Edit Profile',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          leading: Icon(Icons.person),
          onTap: () => {Navigator.pushNamed(context, '/edituser')},
        ),
        SwitchListTile(
          title: Text(
            'Notifications',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          value: _notificationStatus,
          onChanged: (bool value) {
            setState(() {
              _notificationStatus = value;
            });
          },
          activeColor: Color(0xFF78B389),
          inactiveTrackColor: Colors.white,
        ),
        ListTile(
          title: Text(
            'Reset Entire Routine',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          leading: Icon(Icons.refresh),
        ),
        ListTile(
            title: Text(
          'Help & Feedback',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        )),
        ListTile(
          title: Text(
            'Help Center',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          leading: Icon(Icons.help),
        ),
        ListTile(
          title: Text(
            'Privacy Policy',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          leading: Icon(Icons.privacy_tip),
        ),
        ListTile(
          title: Text(
            'Terms and Policies',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          leading: Icon(Icons.description),
        ),
      ],
    );
  }
}
