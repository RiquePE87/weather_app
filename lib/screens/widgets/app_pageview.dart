import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/main_screen_provider.dart';
import 'package:weather_app/screens/forecast_report_screen.dart';
import 'package:weather_app/screens/location_search_screen.dart';
import 'package:weather_app/screens/main_screen.dart';
import 'package:weather_app/screens/widgets/bottom_navigation.dart';

class AppPageView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      bottomNavigationBar: Consumer<MainScreenProvider>(
        builder: (context, provider, child) {
          return BottomNavigation();
        },
      ),
      body: Consumer<MainScreenProvider>(
        builder: (context, provider, child) {
          return PageView(
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: provider.onItemTapped,
            controller: provider.pageController,
            children: [
              MainScreen(),
              LocationSearchScreen(),
              ForecastRepostScreen(),
              Container(),
            ],
          );
        },
      ),
    );
  }
}
