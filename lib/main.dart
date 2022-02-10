import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/main_screen_provider.dart';
import 'package:weather_app/services/navigation_service.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/screens/main_screen.dart';
import 'package:weather_app/screens/widgets/app_pageview.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WeatherProvider()),
        ChangeNotifierProvider(create: (context) => MainScreenProvider())
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      title: 'Material App',
      home: AppPageView(),
    );
  }
}
