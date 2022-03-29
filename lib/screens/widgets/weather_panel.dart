import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/screens/widgets/weather_icon.dart';

import 'info_column.dart';

class WeatherPanel extends StatelessWidget {
  final Weather weather;

  WeatherPanel(this.weather);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        WeatherIcon(weather.current!.condition, weather.current!.isDay!, 0.5),
        Text(
          weather.current!.condition!.text!,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        Consumer<WeatherProvider>(
          builder: (context, provider, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoColumn(
                    title: "Temp",
                    data: provider.isFarenheit!
                        ? "${weather.current!.temperatureF!.round().toString()}ºF"
                        : "${weather.current!.temperatureC!.round().toString()}ºC"),
                InfoColumn(
                    title: "Wind",
                    data: "${weather.current!.windKph.toString()} km/h"),
                InfoColumn(
                    title: "Humidity",
                    data: "${weather.current!.humidity.toString()}%"),
              ],
            );
          },
        ),
      ],
    );
  }
}
