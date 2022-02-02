import 'package:flutter/material.dart';
import 'package:weather_app/Services/navigation_service.dart';
import 'package:weather_app/screens/forecast_report_screen.dart';
import 'package:weather_app/screens/main_screen.dart';

class MainScreenProvider with ChangeNotifier {
  int selectedIndex = 0;
  int selectedPanel = 0;
  final PageController pageController = PageController();
  final PageController panelController = PageController();

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
    //pageController.animateToPage(page, duration: duration, curve: curve)
    pageController.jumpToPage(index);
  }

  void onPanelTap(int index){
    selectedPanel = index;
    notifyListeners();
    panelController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.ease);
  }
}
