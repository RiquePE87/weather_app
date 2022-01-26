import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/forecast_day.dart';
import 'package:weather_app/models/hour.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/provider/weather_provider.dart';

import 'hour_fore_card.dart';

class HourByHourForecast extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Consumer<WeatherProvider>(
      builder: (context, provider, child) {
        return SizedBox(
          height: 80,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: weatherProvider.hourList!.length,
              itemBuilder: (_, index) {
                return HourForeCard(day: weatherProvider.forecastDay!.day,
                  hour: weatherProvider.hourList![index]);
              }),
        );
      },
    );
  }
}


