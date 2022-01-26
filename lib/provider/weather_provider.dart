import 'package:flutter/material.dart';
import 'package:weather_app/models/day.dart';
import 'package:weather_app/models/forecast_day.dart';
import 'package:weather_app/models/hour.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/repository/repository.dart';

class WeatherProvider with ChangeNotifier {
  Weather? weather;
  List<Hour>? hourList;
  ForecastDay? forecastDay;
  List<Map>? conditions;

  WeatherProvider() {
    getLocationWeather("Petrolina");
  }

  void getLocationWeather(String location) {
    Repository()
        .fetchWeather(location, 1)
        .then((value) => weather = value)
        .whenComplete(() {
      setHourList();
      notifyListeners();
    });
  }

  void setHourList() {
    List<ForecastDay>? forecasts = weather!.forecast!.forecasts;
    DateTime actualDate = new DateTime.fromMillisecondsSinceEpoch(
        weather!.location!.localtimeEpoch!);

    forecasts?.forEach((element) {
      DateTime date =
          new DateTime.fromMillisecondsSinceEpoch(element.dateEpoch!);
      if (date.day == actualDate.day) {
        forecastDay = element;
        hourList = element.hour;
      }
    });
  }
}
