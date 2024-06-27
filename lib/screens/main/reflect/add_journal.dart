import 'package:flutter/material.dart';
import 'package:one_at_a_time/models/entry.dart';

class AddJournal extends StatefulWidget {
  final Function(Entry) onJournalAdd;

  const AddJournal({required this.onJournalAdd, super.key});

  @override
  State<AddJournal> createState() => _AddJournalState();
}

class _AddJournalState extends State<AddJournal> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.95,
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Image.asset('assets/icons/back.png'),
                ),
                Text('date'),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Done',
                    style: TextStyle(
                      color: Color(0xff3B3EDE),
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
