import 'package:flutter/material.dart';

class MoodSelector extends StatefulWidget {
  final Function(String) onMoodSelected;

  const MoodSelector({super.key, required this.onMoodSelected});

  @override
  _MoodSelectorState createState() => _MoodSelectorState();
}

class _MoodSelectorState extends State<MoodSelector> {
  String? _selectedEmoji;

  Widget _emojiButton(String emoji) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedEmoji = emoji;
        });
        widget.onMoodSelected(emoji);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        decoration: BoxDecoration(
          color: _selectedEmoji == emoji ? const Color(0XFF3B3EDE) : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          emoji,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _emojiButton('😭'),
        _emojiButton('😣'),
        _emojiButton('😊'),
        _emojiButton('😁'),
        _emojiButton('🥳'),
      ],
    );
  }
}