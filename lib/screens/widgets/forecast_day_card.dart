import 'package:flutter/material.dart';
import 'package:weather_app/models/forecast_day.dart';
import 'package:weather_app/screens/widgets/weather_icon.dart';

class ForecastDayCard extends StatelessWidget {
  ForecastDayCard(this.forecastDay);

  ForecastDay forecastDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
          Text("${forecastDay.day!.avgtempC!.round()}ºC",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400)),
          WeatherIcon(forecastDay.day!.condition, true, 0.8)
        ],
      ),
    );
  }
}
