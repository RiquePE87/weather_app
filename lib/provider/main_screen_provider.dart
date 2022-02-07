import 'package:flutter/material.dart';

class MainScreenProvider with ChangeNotifier {
  int selectedIndex = 0;
  int? selectedPanel = 0;
  PageController? panelController;

  MainScreenProvider(){
    panelController = PageController(keepPage: true, initialPage: selectedIndex);
  }
  final PageController pageController = PageController();


  void onItemTapped(int index) {
    selectedIndex = index;
    selectedPanel = 0;
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
