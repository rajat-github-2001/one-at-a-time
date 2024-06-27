// main_screen.dart
import 'package:flutter/material.dart';
import '../main_screen.dart';
import '../mood_track/mood_track_screen.dart';
import '../user_profile/user_profile_screen.dart';
import '../reflect/reflect_screen.dart';
import '../../../models/task.dart';
import './add_task.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  int _selectedIndex = 2;
  final List<Task> _tasks = [
    Task(title: 'Run 4k', subtitle: 'All Day', emoji: '🏃‍♂️'),
    Task(
        title: 'Take a shower',
        subtitle: '9:30 AM',
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

  void _showAddTaskModal(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Color.fromARGB(255, 241, 231, 224),
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        builder: (context) {
          return AddTaskBottomSheet(
            onTaskAdded: _addTask,
          );
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
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () => _showAddTaskModal(context),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              backgroundColor: Color(0XFF3B3EDE),
            )
          : null,
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

class MainContent extends StatefulWidget {
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
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
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
                  itemCount: widget.tasks.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        _buildTaskCard(widget.tasks[index], index),
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
    bool allCompleted = widget.tasks.every((task) => task.isCompleted);

    if (allCompleted) {
      return [
        _buildCalendarDay(
            Image.asset('assets/icons/star-icon.png'), '30', true),
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

  Widget _buildCalendarDay(dynamic day, String date, bool isSelected) {
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
              day is String
                  ? Text(
                      day,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.grey,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    )
                  : day is Image
                      ? day
                      : Container(),
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
    return Dismissible(
      key: Key(task.title),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        setState(() {
          widget.tasks.removeAt(index);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${task.title} removed'),
          ),
        );
      },
      background: Container(
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
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
                widget.toggleTaskCompletion(index);
              },
            ),
            title: Text(
              task.title,
              style: TextStyle(
                decoration:
                    task.isCompleted ? TextDecoration.lineThrough : null,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              task.subtitle,
              style: TextStyle(
                decoration:
                    task.isCompleted ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
