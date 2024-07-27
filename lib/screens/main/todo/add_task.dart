import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import '../../../models/task.dart';
import './toggle_button.dart';

class AddTaskBottomSheet extends StatefulWidget {
  final Function(Task) onTaskAdded;

  const AddTaskBottomSheet({required this.onTaskAdded, super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  final _titleController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _taskController = TextEditingController();
  String? _selectedEmoji;

  bool _showTimeSelection = false;

  void _submitTask() {
    final newTask = Task(
      title: _titleController.text,
      subtitle: _timeController.text,
      emoji: _selectedEmoji ?? '📝',
    );
    widget.onTaskAdded(newTask);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.95,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        _showTimeSelection = false;
                      });
                    },
                    icon: Image.asset('assets/icons/back.png')),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      Navigator.pushReplacementNamed(context, '/main',
                          arguments: 0);
                    },
                    icon: Image.asset('assets/icons/cross.png')),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    Emoji? emoji = await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight:
                                  MediaQuery.of(context).size.height * 0.7,
                              maxWidth: MediaQuery.of(context).size.width * 0.9,
                            ),
                            child: EmojiPicker(
                              onEmojiSelected: (category, emoji) {
                                Navigator.of(context).pop(emoji);
                              },
                            ),
                          ),
                        );
                      },
                    );
                    if (emoji != null) {
                      setState(() {
                        _selectedEmoji = emoji.emoji;
                      });
                    }
                  },
                  child: Container(
                    child: _selectedEmoji != null
                        ? Text(
                            _selectedEmoji!,
                            style: const TextStyle(fontSize: 50),
                          )
                        : const Icon(
                            Icons.add_reaction_outlined,
                            size: 50,
                          ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: _titleController,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                    decoration: InputDecoration(
                        hintText: 'New Task',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                        border: InputBorder.none),
                  ),
                ),
                Text(
                  'Tap to rename',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade600),
                ),
              ],
            ),
            const SizedBox(
              height: 39,
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              width: 350,
              height: 390,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white,
              ),
              child: _showTimeSelection
                  ? TimeSelectionWidget(controller: _timeController)
                  : Column(
                      children: [
                        TextField(
                          controller: _dateController,
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: 'Date',
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Icon(
                                Icons.calendar_today,
                              ),
                            ),
                          ),
                          onTap: () async {
                            DateTime? selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );
                            if (selectedDate != null) {
                              _dateController.text =
                                  "${selectedDate.toLocal()}".split(' ')[0];
                            }
                          },
                        ),
                        TextField(
                            readOnly: true,
                            controller: _timeController,
                            decoration: const InputDecoration(
                              labelText: 'Timing',
                              suffixIcon: Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Icon(
                                  Icons.access_time,
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                _showTimeSelection = true;
                              });
                            }),
                        TextField(
                          controller: _taskController,
                          decoration: const InputDecoration(
                            labelText: 'Task Breakdown',
                            border: InputBorder.none,
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Icon(
                                Icons.assignment_outlined,
                              ),
                            ),
                          ),
                        ),
                        const TextField(
                          decoration: InputDecoration(
                              prefixIcon: Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(Icons.add))),
                        ),
                        const TextField(
                          decoration: InputDecoration(
                              prefixIcon: Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(Icons.add))),
                        ),
                        const TextField(
                          decoration: InputDecoration(
                              prefixIcon: Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(Icons.add))),
                        ),
                      ],
                    ),
            ),
            const SizedBox(
              height: 24,
            ),
            !_showTimeSelection
                ? ElevatedButton(
                    onPressed: _submitTask,
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0XFF3B3EDE)),
                        elevation: MaterialStateProperty.all(5),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(20)),
                        shadowColor: MaterialStateProperty.all(
                            Colors.black.withOpacity(0.5))),
                    child: const Text(
                      'Add Task',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _taskController.dispose();
    super.dispose();
  }
}

class TimeSelectionWidget extends StatefulWidget {
  final TextEditingController controller;

  const TimeSelectionWidget({super.key, required this.controller});

  @override
  State<TimeSelectionWidget> createState() => _TimeSelectionWidgetState();
}

class _TimeSelectionWidgetState extends State<TimeSelectionWidget> {
  bool _showSpecificTime = false;
  final _startTimeController = TextEditingController();
  final _endTimeController = TextEditingController();

  @override
  void dispose() {
    _startTimeController.dispose();
    _endTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text('Choose the timing',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              )),
          const SizedBox(
            height: 34,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.access_time_filled),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'All Day',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              ToggleButton(
                onToggle: (bool isToggled) {
                  setState(() {
                    widget.controller.text = isToggled ? 'All day' : '';
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.access_time_outlined),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Specific time',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              ToggleButton(
                onToggle: (bool isToggled) {
                  setState(() {
                    _showSpecificTime = isToggled;
                    if (!_showSpecificTime) {
                      _startTimeController.clear();
                      _endTimeController.clear();
                      widget.controller.clear();
                    }
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          _showSpecificTime
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Start time',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade600),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: 90,
                          height: 55,
                          child: TextField(
                              controller: _startTimeController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 241, 231, 224),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none),
                              ),
                              readOnly: true,
                              onTap: () async {
                                TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );
                                if (pickedTime != null) {
                                  setState(() {
                                    _startTimeController.text =
                                        pickedTime.format(context);
                                  });
                                }
                              }),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'End time',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade600),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: 90,
                          height: 55,
                          child: TextField(
                              controller: _endTimeController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 241, 231, 224),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none),
                              ),
                              readOnly: true,
                              onTap: () async {
                                TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );
                                if (pickedTime != null) {
                                  setState(() {
                                    _endTimeController.text =
                                        pickedTime.format(context);
                                    _updateController();
                                  });
                                }
                              }),
                        ),
                      ],
                    )
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  void _updateController() {
    if (_startTimeController.text.isNotEmpty &&
        _endTimeController.text.isNotEmpty) {
      widget.controller.text =
          "${_startTimeController.text} - ${_endTimeController.text}";
    }
  }
}
