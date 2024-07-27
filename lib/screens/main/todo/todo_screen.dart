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
  int _selectedIndex = 0;
  final List<Task> _tasks = [
    Task(title: 'Run 4k', subtitle: 'All Day', emoji: '🏃‍♂️'),
    Task(
        title: 'Take a shower',
        subtitle: '9:30 AM',
        isCompleted: true,
        emoji: '🚿'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as int?;
    if (args != null) {
      setState(() {
        _selectedIndex = args;
      });
    }
  }

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
        backgroundColor: const Color.fromARGB(255, 241, 231, 224),
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        builder: (context) {
          return AddTaskBottomSheet(
            onTaskAdded: _addTask,
          );
        });
  }

  void _showEditTaskModal(BuildContext context, Task task, int index) {
    final _titleController = TextEditingController(text: task.title);
    final _subtitleController = TextEditingController(text: task.subtitle);
    String? _selectedEmoji = task.emoji;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.8,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: _subtitleController,
                  decoration: const InputDecoration(labelText: 'Subtitle'),
                ),
                SizedBox(height: 16,),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _tasks[index] = Task(
                        title: _titleController.text,
                        subtitle: _subtitleController.text,
                        emoji: _selectedEmoji ?? task.emoji,
                      );
                    });
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0XFF3B3EDE)),
                      elevation: MaterialStateProperty.all(5),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(20)),
                      shadowColor: MaterialStateProperty.all(
                          Colors.black.withOpacity(0.5))),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _selectedIndex == 0
            ? MainContent(
                tasks: _tasks,
                addTask: _addTask,
                toggleTaskCompletion: _toggleTaskCompletion,
                showEditTaskModal: _showEditTaskModal,
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
              backgroundColor: const Color(0XFF3B3EDE),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  static final List<Widget> _widgetOptions = <Widget>[
    MainContent(
        tasks: const [],
        addTask: (task) {},
        toggleTaskCompletion: (index) {},
        showEditTaskModal: (context, task, index) {}),
    const MoodTrackScreen(),
    const ReflectScreen(),
    const UserProfileScreen(),
  ];
}

class MainContent extends StatefulWidget {
  final List<Task> tasks;
  final Function(Task) addTask;
  final Function(int) toggleTaskCompletion;
  final Function(BuildContext, Task, int) showEditTaskModal;

  const MainContent({
    required this.tasks,
    required this.addTask,
    required this.toggleTaskCompletion,
    required this.showEditTaskModal,
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
            Image.asset('assets/icons/star-icon.png'), '18', true),
        _buildCalendarDay('Fri', '19', false),
        _buildCalendarDay('Sat', '20', false),
        _buildCalendarDay('Sun', '21', false),
        _buildCalendarDay('Mon', '22', false),
        _buildCalendarDay('Tue', '23', false),
      ];
    }

    return [
      _buildCalendarDay('Tue', '18', true),
      _buildCalendarDay('Fri', '19', false),
      _buildCalendarDay('Sat', '20', false),
      _buildCalendarDay('Sun', '21', false),
      _buildCalendarDay('Mon', '22', false),
      _buildCalendarDay('Tue', '23', false),
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
              color: isSelected ? const Color(0XFF3B3EDE) : Colors.transparent,
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
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
        decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: const Icon(
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
              style: const TextStyle(fontSize: 24),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    widget.showEditTaskModal(context, task, index);
                  },
                ),
                IconButton(
                  icon: task.isCompleted
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : const Icon(Icons.radio_button_unchecked),
                  onPressed: () {
                    widget.toggleTaskCompletion(index);
                  },
                ),
              ],
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
