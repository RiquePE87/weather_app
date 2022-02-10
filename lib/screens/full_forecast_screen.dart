import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';

class FullForecastScreen extends StatelessWidget {

  Weather _weather;
  TextStyle _title = TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w400);

  FullForecastScreen(this._weather);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        backgroundColor: Color.fromARGB(255, 9, 11, 53),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(colors: [
              Color.fromARGB(255, 9, 80, 135),
              Color.fromARGB(255, 9, 11, 53),
            ], center: Alignment(0.8, -1.0), radius: 0.9)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text("${_weather.location!.name}, ${_weather.location!.region}", style: _title,)),
            Text("${_weather.current!.cloud}")
          ],
        ),
      ),
    );
  }
}
