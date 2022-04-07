import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/forecast_day.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/screens/widgets/weather_icon.dart';

class ForecastDayCard extends StatelessWidget {
  ForecastDayCard(this.forecastDay);

  final ForecastDay forecastDay;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      color: Color.fromARGB(255, 16, 18, 48),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(forecastDay.date.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400)),
                Text("Day",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400))
              ],
            ),
            Consumer<WeatherProvider>(
              builder: (context, provider, child) {
                return Text(
                    provider.isFarenheit!
                        ? "${forecastDay.day!.avgtempF!.round()}ºF"
                        : "${forecastDay.day!.avgtempC!.round()}ºC",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w400));
              },
            ),
            WeatherIcon(forecastDay.day!.condition, true, 0.8)
          ],
        ),
      ),
    );
  }
}
