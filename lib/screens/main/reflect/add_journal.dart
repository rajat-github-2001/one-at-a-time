import 'package:flutter/material.dart';
import 'package:one_at_a_time/models/entry.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class AddJournal extends StatefulWidget {
  final Function(Entry) onJournalAdd;

  const AddJournal({required this.onJournalAdd, super.key});

  @override
  State<AddJournal> createState() => _AddJournalState();
}

class _AddJournalState extends State<AddJournal> {
  DateTime selectedDate = DateTime.now();
  String formattedDate = DateFormat('d MMMM, yyyy').format(DateTime.now());
  bool isWritingWithPrompt = false;
  bool isWritingJournal = false;
  TextEditingController journalController = TextEditingController();
  TextEditingController promptController = TextEditingController();

  List<Color> colors = [
    Colors.red.shade100,
    Colors.blue.shade100,
    Colors.green.shade100,
    Colors.orange.shade100,
    Colors.purple.shade100,
    Colors.pink.shade100,
    Colors.cyan.shade100,
    Colors.amber.shade100,
    Colors.lime.shade100,
    Colors.yellow.shade200
  ];

  Color getRandomColor() {
    final random = Random();
    return colors[random.nextInt(colors.length)];
  }

  @override
  void dispose() {
    journalController.dispose();
    promptController.dispose();
    super.dispose();
  }

  void handleBackButton() {
    if (isWritingJournal || isWritingWithPrompt) {
      setState(() {
        isWritingJournal = false;
        isWritingWithPrompt = false;
      });
    } else {
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.pushReplacementNamed(context, '/main', arguments: 2);
    }
  }

  void handleDoneButton() {
    if (isWritingJournal || isWritingWithPrompt) {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        builder: (BuildContext context) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -75.0,
                right: 8.0,
                child: Image.asset(
                  'assets/icons/cat.png',
                  width: 100,
                  height: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Finish?',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Finished with your journal??',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.all(20.0),
                            side: const BorderSide(color: Color(0xff3B3EDE)),
                          ),
                          child: const Text('No.'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            String journalText = isWritingJournal
                                ? journalController.text
                                : promptController.text;
                            String type = isWritingJournal
                                ? 'personal_diary'
                                : 'reflection';
                            String? prompt = isWritingWithPrompt
                                ? 'Write down three of the best things you’ve accomplished so far.'
                                : null;
                            Color color = isWritingWithPrompt
                                ? const Color(0xffF8F2EB)
                                : getRandomColor();

                            Entry newEntry = Entry(
                              date: formattedDate,
                              journal: journalText,
                              type: type,
                              color: color,
                              prompt: prompt,
                            );

                            widget.onJournalAdd(newEntry);
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Your journal has been added'),
                              ),
                            );
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff3B3EDE),
                            padding: const EdgeInsets.all(20.0),
                          ),
                          child: const Text(
                            'Finish!',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.95,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: handleBackButton,
                  icon: Image.asset('assets/icons/back.png'),
                ),
                Text(formattedDate,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    )),
                TextButton(
                  onPressed: handleDoneButton,
                  child: const Text(
                    'Done',
                    style: TextStyle(
                        color: Color(0xff3B3EDE),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            if (!isWritingWithPrompt && !isWritingJournal) ...[
              GestureDetector(
                onTap: () {
                  setState(() {
                    isWritingWithPrompt = true;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xffF8F2EB),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reflect with Daily Prompt',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff3B3EDE)),
                      ),
                      SizedBox(height: 8),
                      Text(
                          'Write down three of the best things you’ve accomplished so far.')
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'OR',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isWritingJournal = true;
                  });
                },
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xffF8F2EB),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: const Text(
                    'Just start writing...',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffB0B2C3),
                    ),
                  ),
                ),
              ),
            ] else if (isWritingWithPrompt) ...[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: const BoxDecoration(
                        color: Color(0xffF8F2EB),
                      ),
                      child: const Text(
                        'Write down three of the best things you’ve accomplished so far.',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: TextField(
                        controller: promptController,
                        maxLines: null,
                        expands: true,
                        decoration: const InputDecoration(
                          hintText: 'Start writing your reflections here...',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                        textAlignVertical: TextAlignVertical.top,
                      ),
                    ),
                  ],
                ),
              )
            ] else if (isWritingJournal) ...[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: journalController,
                        maxLines: null,
                        expands: true,
                        decoration: const InputDecoration(
                            hintText: 'Start writing your journal here...',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(8.0)),
                        textAlignVertical: TextAlignVertical.top,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ],
        ),
      ),
    );
  }
}
