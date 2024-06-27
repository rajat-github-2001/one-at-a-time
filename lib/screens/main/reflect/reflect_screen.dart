import 'package:flutter/material.dart';

class ReflectScreen extends StatefulWidget {
  const ReflectScreen({super.key});

  @override
  State<ReflectScreen> createState() => _ReflectScreenState();
}

class _ReflectScreenState extends State<ReflectScreen> {
  int selectedChipIndex = 0;
  List<Map<String, dynamic>> entries = [
    {
      'date': '24 May 2023',
      'journal':
          'Feeling Sad with 29 others and Lorem Epsum: dadadadadadadaddadadada:',
      'type': 'reflection',
      'color': Colors.yellow.shade100,
      'prompt': 'What made you feel this way?'
    },
    {
      'date': '23 May 2023',
      'journal': 'Had a wonderful day at the park with friends.',
      'type': 'personal_diary',
      'color': Colors.red.shade100,
    },
    {
      'date': '22 May 2023',
      'journal': 'Feeling motivated and ready to tackle new challenges!',
      'type': 'reflection',
      'color': Colors.green.shade100,
      'prompt': 'What challenges are you planning to tackle?'
    },
    {
      'date': '21 May 2023',
      'journal': 'Spent the evening reading a book and relaxing.',
      'type': 'personal_diary',
      'color': Colors.blue.shade100,
    },
    {
      'date': '20 May 2023',
      'journal': 'Feeling anxious about upcoming exams.',
      'type': 'reflection',
      'color': Colors.orange.shade100,
      'prompt': 'What can you do to reduce your anxiety?'
    },
    {
      'date': '19 May 2023',
      'journal': 'Had a delicious meal at a new restaurant.',
      'type': 'personal_diary',
      'color': Colors.purple.shade100,
    },
    {
      'date': '18 May 2023',
      'journal': 'Feeling grateful for my family and friends.',
      'type': 'reflection',
      'color': Colors.pink.shade100,
      'prompt': 'What specific things are you grateful for?'
    },
    {
      'date': '17 May 2023',
      'journal': 'Watched a great movie with my siblings.',
      'type': 'personal_diary',
      'color': Colors.cyan.shade100,
    },
    {
      'date': '16 May 2023',
      'journal': 'Feeling tired but accomplished after a productive day.',
      'type': 'reflection',
      'color': Colors.amber.shade100,
      'prompt': 'What did you accomplish today?'
    },
    {
      'date': '15 May 2023',
      'journal': 'Enjoyed a peaceful walk in the park.',
      'type': 'personal_diary',
      'color': Colors.lime.shade100,
    },
  ];

  List<Map<String, dynamic>> getFilteredEntries() {
    if (selectedChipIndex == 0) {
      return entries;
    } else if (selectedChipIndex == 1) {
      return entries.where((entry) => entry['type'] == 'reflection').toList();
    } else {
      return entries
          .where((entry) => entry['type'] == 'personal_diary')
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredEntries = getFilteredEntries();

    return Scaffold(
      appBar: AppBar(
        title: Text('For happier you!'),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.edit),
                  label: Text('New Entry',
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
                    minimumSize: Size(260, 56),
                  ),
                ),
                Chip(
                  label: Text('4d Streak'),
                  avatar: Image.asset('assets/icons/fire.png'),
                  backgroundColor: Colors.white,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  side: BorderSide(color: Colors.transparent),
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
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: entry['color'],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entry['date'],
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 8),
                        Text(
                          entry['journal'],
                          style: TextStyle(fontSize: 16),
                        ),
                        if (entry['type'] == 'reflection') ...[
                          SizedBox(height: 8),
                          Text(
                            'Prompt: ${entry['prompt']}',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ],
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
