import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/screens/widgets/weather_icon.dart';

import 'info_column.dart';

class WeatherPanel extends StatelessWidget {

  Weather weather;

  WeatherPanel(this.weather);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        WeatherIcon(weather.current!.condition,
            weather.current!.isDay!, 0.4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InfoColumn(
                title: "Temp",
                data:
                "${weather.current!.temperatureC!.round().toString()}ªC"),
            InfoColumn(
                title: "Wind",
                data:
                "${weather.current!.windKph.toString()} km/h"),
            InfoColumn(
                title: "Humidity",
                data:
                "${weather.current!.humidity.toString()}%"),
          ],
        ),
      ],
    );
  }
}
