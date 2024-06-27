// widgets/custom_bottom_navigation_bar.dart
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset(
             currentIndex == 0 ? 'assets/icons/home-blue.png' : 'assets/icons/home.png',
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            currentIndex == 1 ? 'assets/icons/mood-blue.png' : 'assets/icons/mood.png',
          ),
          label: 'Track',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            currentIndex == 2 ? 'assets/icons/book-blue.png' : 'assets/icons/book.png',
          ),
          label: 'Reflect',
        ),
        BottomNavigationBarItem(
          icon:Image.asset(
            currentIndex == 3 ? 'assets/icons/profile-blue.png' : 'assets/icons/profile.png',
          ),
          label: 'Profile',
        ),
      ],
      showUnselectedLabels: true,
      currentIndex: currentIndex,
      selectedItemColor: Color(0XFF3B3EDE),
      unselectedItemColor: Colors.grey,
      onTap: onTap,
    );
  }
}
