import 'package:flutter/material.dart';
import 'package:weather_app/Services/navigation_service.dart';
import 'package:weather_app/screens/forecast_report_screen.dart';
import 'package:weather_app/screens/main_screen.dart';

class MainScreenProvider with ChangeNotifier {
  int selectedIndex = 0;
  int? selectedPanel = 0;
  PageController? panelController;
  int h =0;

  MainScreenProvider(){
    panelController = PageController(keepPage: true, initialPage: selectedIndex);
  }
  final PageController pageController = PageController();


  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
    //pageController.animateToPage(page, duration: duration, curve: curve)
    pageController.jumpToPage(index);
  }

  void onPanelTap(int index){
    selectedPanel = index;
    panelController!.animateToPage(selectedPanel!, duration: Duration(milliseconds: 300), curve: Curves.ease);
    notifyListeners();
  }
}
