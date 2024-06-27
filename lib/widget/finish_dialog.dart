// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void showFinishDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Stack(
        children: [
          AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Text(
              'Finish?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            content: Text(
              'Finished with mood track??',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  fixedSize: Size(120, 48),
                  side: BorderSide(
                    color: Color(0xFF4B4BDD), // Border color
                    width: 1, // Border width
                  ),
                ),
                child: Text(
                  'No.',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(120, 48),
                  backgroundColor: Color(0xFF4B4BDD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Finish!',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Navigator.pushReplacementNamed(context, '/main');

                  // Add your finish logic here
                },
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.35, // Adjust as needed
            left:
                MediaQuery.of(context).size.width * 0.5 - 30, // Center the cat
            child: Image.asset(
              'assets/icons/cat.png',
              width: 60,
              height: 60,
            ),
          ),
        ],
      );
    },
  );
}
