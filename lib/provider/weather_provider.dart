import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/repository/repository.dart';

class WeatherProvider with ChangeNotifier{

  Weather? weather;

  WeatherProvider(){
    getLocationWeather("Recife");
  }

  void getLocationWeather(String location){
    Repository().fetchWeather(location, 1).then((value) =>
    weather = value).whenComplete(() => notifyListeners());
  }
}