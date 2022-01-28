import 'package:flutter/material.dart';
import 'package:weather_app/Services/navigation_service.dart';
import 'package:weather_app/screens/forecast_report_screen.dart';
import 'package:weather_app/screens/main_screen.dart';

class MainScreenProvider with ChangeNotifier {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    selectedIndex = index;

    switch (index) {
      case 0:
        Navigator.push((NavigationService.navigatorKey.currentContext!),
            MaterialPageRoute(builder: (_) => MainScreen()));
        break;
      case 2:
        Navigator.push((NavigationService.navigatorKey.currentContext!),
            MaterialPageRoute(builder: (_) => ForecastRepostScreen()));
        break;
      case 3:
        break;
    }
    notifyListeners();
  }
}
