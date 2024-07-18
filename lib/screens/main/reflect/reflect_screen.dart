import 'package:flutter/material.dart';
import './add_journal.dart';
import '../../../models/entry.dart';

class ReflectScreen extends StatefulWidget {
  const ReflectScreen({super.key});

  @override
  State<ReflectScreen> createState() => _ReflectScreenState();
}

class _ReflectScreenState extends State<ReflectScreen> {
  int selectedChipIndex = 0;
  List<Entry> entries = [
    Entry(
      date: '24 May 2023',
      journal: 'Feeling Sad',
      type: 'reflection',
      color: const Color(0xffF8F2EB),
      prompt: 'What made you feel this way?',
    ),
    Entry(
      date: '23 May 2023',
      journal: 'Had a wonderful day at the park with friends.',
      type: 'personal_diary',
      color: Colors.red.shade100,
    ),
    Entry(
      date: '22 May 2023',
      journal: 'Feeling motivated and ready to tackle new challenges!',
      type: 'reflection',
      color: const Color(0xffF8F2EB),
      prompt: 'What challenges are you planning to tackle?',
    ),
    Entry(
      date: '21 May 2023',
      journal: 'Spent the evening reading a book and relaxing.',
      type: 'personal_diary',
      color: Colors.blue.shade100,
    ),
    Entry(
      date: '20 May 2023',
      journal: 'Feeling anxious about upcoming exams.',
      type: 'reflection',
      color: const Color(0xffF8F2EB),
      prompt: 'What can you do to reduce your anxiety?',
    ),
    Entry(
      date: '19 May 2023',
      journal: 'Had a delicious meal at a new restaurant.',
      type: 'personal_diary',
      color: Colors.purple.shade100,
    ),
    Entry(
      date: '18 May 2023',
      journal: 'Feeling grateful for my family and friends.',
      type: 'reflection',
      color: const Color(0xffF8F2EB),
      prompt: 'What specific things are you grateful for?',
    ),
    Entry(
      date: '17 May 2023',
      journal: 'Watched a great movie with my siblings.',
      type: 'personal_diary',
      color: Colors.cyan.shade100,
    ),
    Entry(
      date: '16 May 2023',
      journal: 'Feeling tired but accomplished after a productive day.',
      type: 'reflection',
      color: const Color(0xffF8F2EB),
      prompt: 'What did you accomplish today?',
    ),
    Entry(
      date: '15 May 2023',
      journal: 'Enjoyed a peaceful walk in the park.',
      type: 'personal_diary',
      color: Colors.lime.shade100,
    ),
  ];

  void _addJournal(Entry entry) {
    setState(() {
      entries.insert(0, entry); // Insert the new entry at the 0th index
    });
  }

  void _removeJournal(int index) {
    setState(() {
      entries.removeAt(index); // Remove the entry at the specified index
    });
  }

  List<Entry> getFilteredEntries() {
    if (selectedChipIndex == 0) {
      return entries;
    } else if (selectedChipIndex == 1) {
      return entries.where((entry) => entry.type == 'reflection').toList();
    } else {
      return entries.where((entry) => entry.type == 'personal_diary').toList();
    }
  }

  void _showNewEntryModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) {
        return AddJournal(
          onJournalAdd: _addJournal,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Entry> filteredEntries = getFilteredEntries();

    return Scaffold(
      appBar: AppBar(
        title: const Text('For happier you!'),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ChoiceChip(
                    label: Text(
                      'All (${entries.length})',
                      style: TextStyle(color: Colors.black),
                    ),
                    selected: selectedChipIndex == 0,
                    selectedColor: Color(0xffD0F1FF),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    side: BorderSide(
                      color: selectedChipIndex == 0
                          ? Color(0xff3B3EDE)
                          : Colors.grey,
                      width: 2.0,
                    ),
                    onSelected: (bool selected) {
                      setState(() {
                        selectedChipIndex = 0;
                      });
                    },
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  ChoiceChip(
                    label: Text('Reflections',
                        style: TextStyle(color: Colors.black)),
                    selected: selectedChipIndex == 1,
                    selectedColor: Color(0xffD0F1FF),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    side: BorderSide(
                      color: selectedChipIndex == 1
                          ? Color(0xff3B3EDE)
                          : Colors.grey,
                      width: 2.0,
                    ),
                    onSelected: (bool selected) {
                      setState(() {
                        selectedChipIndex = 1;
                      });
                    },
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  ChoiceChip(
                    label: Text('Personal Diary',
                        style: TextStyle(color: Colors.black)),
                    selected: selectedChipIndex == 2,
                    selectedColor: Color(0xffD0F1FF),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    side: BorderSide(
                      color: selectedChipIndex == 2
                          ? Color(0xff3B3EDE)
                          : Colors.grey,
                      width: 2.0,
                    ),
                    onSelected: (bool selected) {
                      setState(() {
                        selectedChipIndex = 2;
                      });
                    },
                  ),
                  SizedBox(
                    width: 4,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    _showNewEntryModal(context);
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text('New Entry',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: Size(210, 56),
                  ),
                ),
                Chip(
                  label: const Text('4d Streak'),
                  avatar: Image.asset('assets/icons/fire.png'),
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  side: const BorderSide(color: Colors.transparent),
                  elevation: 1.0,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredEntries.length,
              itemBuilder: (context, index) {
                var entry = filteredEntries[index];
                return Dismissible(
                  key: Key(entry.date + entry.journal),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    _removeJournal(entries.indexOf(entry));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Entry dismissed')),
                    );
                  },
                  background: Container(
                    margin: const EdgeInsets.only(right: 16.0),
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Container(
                      width: 400,
                      decoration: BoxDecoration(
                        color: entry.color,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            entry.date,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            entry.journal,
                            style: const TextStyle(fontSize: 16),
                          ),
                          if (entry.type == 'reflection') ...[
                            const SizedBox(height: 8),
                            Text(
                              '${entry.prompt}',
                              style:
                                  const TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
