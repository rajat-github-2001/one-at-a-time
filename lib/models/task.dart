class Task {
  String title;
  String subtitle;
  bool isCompleted;
  String emoji;

  Task({
    required this.title,
    required this.subtitle,
    this.isCompleted = false,
    required this.emoji,
  });
}