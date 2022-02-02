import 'package:flutter/material.dart';
import 'package:weather_app/Services/weather_service.dart';
import 'package:weather_app/models/forecast_day.dart';
import 'package:weather_app/models/hour.dart';
import 'package:weather_app/models/weather.dart';

class WeatherProvider with ChangeNotifier {
  Weather? weather;
  List<Hour>? hourList;
  ForecastDay? forecastDay;
  List<Map>? conditions;
  bool? hasError;
  List<Weather>? searchList = [];

  WeatherProvider() {
    getLocationWeather("Recife");
  }

  void getLocationWeather(String location) {
    if (location.isNotEmpty) {
      WeatherService()
          .fetchWeather(location, 7)
          .then((value) => weather = value)
          .whenComplete(() {
        setHourList();
        addLocation();
        SnackBar(content: Text("Location changed to ${weather!.location!.name}"));
        notifyListeners();
      });
    }
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

  void addLocation() {
    searchList!.add(weather!);
    notifyListeners();
  }

  void removeLocation(Weather weather) {
    searchList!.remove(weather);
    notifyListeners();
  }
}
