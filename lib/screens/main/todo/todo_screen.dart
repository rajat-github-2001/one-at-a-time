// main_screen.dart
import 'package:flutter/material.dart';
import '../main_screen.dart'; 
import '../mood_track/mood_track_screen.dart';
import '../user_profile/user_profile_screen.dart';
import '../reflect/reflect_screen.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  int _selectedIndex = 0;
  final List<Task> _tasks = [
    Task(title: 'Run 4k', subtitle: 'Note lorem ipsum', emoji: '🏃‍♂️'),
    Task(
        title: 'Take a shower',
        subtitle: 'Note lorem ipsum',
        isCompleted: true,
        emoji: '🚿'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addTask(Task task) {
    setState(() {
      _tasks.add(task);
    });
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _selectedIndex == 0
            ? MainContent(
                tasks: _tasks,
                addTask: _addTask,
                toggleTaskCompletion: _toggleTaskCompletion,
              )
            : _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: _selectedIndex == 0 ? FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddTaskDialog(
                onTaskAdded: _addTask,
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color(0XFF3B3EDE),
      ) : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  static List<Widget> _widgetOptions = <Widget>[
    MainContent(
        tasks: [], addTask: (task) {}, toggleTaskCompletion: (index) {}),
    MoodTrackScreen(),
    ReflectScreen(),
    UserProfileScreen(),
  ];
}

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

class MainContent extends StatelessWidget {
  final List<Task> tasks;
  final Function(Task) addTask;
  final Function(int) toggleTaskCompletion;

  const MainContent({
    required this.tasks,
    required this.addTask,
    required this.toggleTaskCompletion,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color(0xFFD0EEFF),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 26),
              Text(
                'Seize the day, Slesha!',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _buildCalendarRow(),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: const Color(0xFFD0EEFF),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              child: Container(
                color: Colors.white,
                child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        _buildTaskCard(tasks[index], index),
                        const SizedBox(height: 8),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildCalendarRow() {
    bool allCompleted = tasks.every((task) => task.isCompleted);

    if (allCompleted) {
      return [
        _buildCalendarDay('⭐', '30', true),
        _buildCalendarDay('Tue', '01', false),
        _buildCalendarDay('Wed', '02', false),
        _buildCalendarDay('Thu', '03', false),
        _buildCalendarDay('Fri', '04', false),
        _buildCalendarDay('Sat', '05', false),
      ];
    }

    return [
      _buildCalendarDay('Mon', '30', true),
      _buildCalendarDay('Tue', '01', false),
      _buildCalendarDay('Wed', '02', false),
      _buildCalendarDay('Thu', '03', false),
      _buildCalendarDay('Fri', '04', false),
      _buildCalendarDay('Sat', '05', false),
    ];
  }

  Widget _buildCalendarDay(String day, String date, bool isSelected) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 4,
          ),
          decoration: BoxDecoration(
              color: isSelected ? Color(0XFF3B3EDE) : Colors.transparent,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            children: [
              Text(
                day,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTaskCard(Task task, int index) {
    return Card(
      child: ListTile(
        leading: Text(
          task.emoji,
          style: TextStyle(fontSize: 24),
        ),
        trailing: IconButton(
          icon: task.isCompleted
              ? Icon(Icons.check_circle, color: Colors.green)
              : Icon(Icons.radio_button_unchecked),
          onPressed: () {
            toggleTaskCompletion(index);
          },
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          task.subtitle,
          style: TextStyle(
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
      ),
    );
  }
}

class AddTaskDialog extends StatefulWidget {
  final Function(Task) onTaskAdded;

  const AddTaskDialog({required this.onTaskAdded, super.key});

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final _titleController = TextEditingController();
  final _subtitleController = TextEditingController();
  final _emojiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: _subtitleController,
            decoration: InputDecoration(labelText: 'Subtitle'),
          ),
          TextField(
            controller: _emojiController,
            decoration: InputDecoration(labelText: 'Emoji'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final task = Task(
              title: _titleController.text,
              subtitle: _subtitleController.text,
              emoji: _emojiController.text,
            );
            widget.onTaskAdded(task);
            Navigator.of(context).pop();
          },
          child: Text('Add'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _subtitleController.dispose();
    _emojiController.dispose();
    super.dispose();
  }
}
