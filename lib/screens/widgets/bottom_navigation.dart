import 'package:flutter/material.dart';
import 'package:weather_app/provider/main_screen_provider.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
    required this.mainScreenProvider,
  }) : super(key: key);

  final MainScreenProvider mainScreenProvider;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: mainScreenProvider.onItemTapped,
      currentIndex: mainScreenProvider.selectedIndex,
      items: [
        BottomNavigationBarItem(
            label: "",
            backgroundColor: Colors.transparent,
            icon: Icon(
              Icons.home_filled,
              color: Colors.white,
            )),
        BottomNavigationBarItem(
            label: "",
            backgroundColor: Colors.transparent,
            icon: Icon(
              Icons.search_rounded,
              color: Colors.white,
            )),
        BottomNavigationBarItem(
            label: "",
            backgroundColor: Colors.transparent,
            icon: Icon(
              Icons.insert_chart_outlined_rounded,
              color: Colors.white,
            )),
        BottomNavigationBarItem(
            label: "",
            backgroundColor: Colors.transparent,
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            )),
      ],
    );
  }
}