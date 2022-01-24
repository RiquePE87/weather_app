import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/screens/main_screen.dart';

void main() => runApp(ChangeNotifierProvider(create: (context) => WeatherProvider(), child: MyApp(),));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: MainScreen());
  }
}
