import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/main_screen_provider.dart';
import 'package:weather_app/provider/weather_provider.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Consumer<MainScreenProvider>(
      builder: (context, provider, child) {
        return BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromARGB(255, 9, 11, 53),
          onTap: weatherProvider.weather != null ? provider.onItemTapped : null,
          currentIndex: provider.selectedIndex,
          items: [
            BottomNavigationBarItem(
                label: "",
                backgroundColor: Colors.transparent,
                icon: Icon(
                  Icons.home_filled,
                )),
            BottomNavigationBarItem(
                label: "",
                backgroundColor: Colors.transparent,
                icon: Icon(
                  Icons.search_rounded,
                )),
            BottomNavigationBarItem(
                label: "",
                backgroundColor: Colors.transparent,
                icon: Icon(
                  Icons.insert_chart_outlined_rounded,
                )),
            BottomNavigationBarItem(
                label: "",
                backgroundColor: Colors.transparent,
                icon: Icon(
                  Icons.settings,
                )),
          ],
        );
      },
    );
  }
}
