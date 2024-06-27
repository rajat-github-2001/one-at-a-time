import 'package:flutter/material.dart';

class Entry {
  final String date;
  final String journal;
  final String type;
  final Color color;
  final String? prompt;

  Entry({
    required this.date,
    required this.journal,
    required this.type,
    required this.color,
    this.prompt,
  });
}