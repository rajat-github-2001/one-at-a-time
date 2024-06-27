import 'package:flutter/foundation.dart';

class MoodCard extends ChangeNotifier {
  bool _isUpdated = false;
  String _updatedText = '';

  bool get isUpdated => _isUpdated;
  String get updatedText => _updatedText;

  void updateMood() {
    _isUpdated = true;
    notifyListeners();
  }

  void updateMoodText(String newText) {
    _updatedText = newText; // Update the text with new data
    // _isUpdated = true;
    notifyListeners();
  }
}
