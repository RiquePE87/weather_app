import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/provider/weather_provider.dart';

class FullForecastScreen extends StatelessWidget {
  final Weather _weather;
  final TextStyle _title = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

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
            Center(
                child: Text(
              "${_weather.location!.name},"
              "\n"
              "${_weather.location!.region}",
              textAlign: TextAlign.center,
              style: _title,
            )),
            Consumer<WeatherProvider>(builder: ((context, provider, child) {
              return Text(
                provider.isFarenheit!
                    ? "${_weather.current!.temperatureF!.round()}ºF"
                    : "${_weather.current!.temperatureC!.round()}ºC",
                style: _title,
              );
            })),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: [
                  Container(
                    child: Column(
                      children: [
                        Image.asset(
                          "images/celsius.png",
                          scale: 0.1,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
