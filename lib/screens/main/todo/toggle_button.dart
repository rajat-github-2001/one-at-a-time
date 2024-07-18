import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  final ValueChanged<bool> onToggle;

  const ToggleButton({super.key, required this.onToggle});

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool isToggled = false;

  void toggleButton() {
    setState(() {
      isToggled = !isToggled;
    });
    widget.onToggle(isToggled);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleButton,
      child: Container(
        width: 50,
        height: 25,
        decoration: BoxDecoration(
          color: isToggled ? Colors.green : Colors.grey,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: isToggled ? Alignment.centerRight : Alignment.centerLeft,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}