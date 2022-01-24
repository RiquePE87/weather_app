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
        return ListView.builder(
            itemCount: weatherProvider.weather!.forecast!.forecasts!.length,
            itemBuilder: (_, index) {
              return HourForeCard();
            });
      },
    );
  }
  List<Hour>? setHourList(Weather weather, int dateEpoch){

    List<ForecastDay>? forecasts = weather.forecast!.forecasts;
    List<Hour>? hours;



    DateTime actualDate = new DateTime.fromMillisecondsSinceEpoch(weather.location!.localtimeEpoch!);
    DateTime forecastDate = new DateTime.fromMillisecondsSinceEpoch(dateEpoch);

    if (actualDate.isAtSameMomentAs(forecastDate)){

    }

    return hours;
  }
}


