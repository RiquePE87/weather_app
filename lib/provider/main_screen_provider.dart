import 'package:flutter/material.dart';
import 'package:weather_app/provider/navigation_service.dart';
import 'package:weather_app/screens/forecast_report_screen.dart';

class MainScreenProvider with ChangeNotifier {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    selectedIndex = index;

    switch (index) {
      case 2:
        Navigator.push((NavigationService.navigatorKey.currentContext!),
            MaterialPageRoute(builder: (_) => ForecastRepostScreen()));
    }
    notifyListeners();
  }
}
