import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather_app/models/day.dart';
import 'package:weather_app/models/hour.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/repository/condition.dart';

class Repository {
  final String urlBase = "http://api.weatherapi.com/v1/forecast.json?key=";
  final String key = "4611193cd03d47fb977132900222201";

  Future<dynamic> _getHttp(String city, int days) async {
    String request = "$urlBase$key&q=$city&days=$days&aqi=no&alerts=no";

    var response;
    try {
      response = await Dio().get(request);
    } catch (ex) {
      print(ex);
    }

    return response;
  }

  Future<Weather?> fetchWeather(String city, int days) async {
    Weather? weather;
    var response;
    try {
      await _getHttp(city, days).then((value) => response = value);
      weather = Weather.fromJson(jsonDecode(response.toString()));
      return weather;
    } catch (ex) {
      print(ex);
      return null;
    }
  }
  setCondition(){
    var conditions = json.decode(CONDITIONS);
   return conditions;
  }

  String? setConitionIcon({Day? day, Hour? hour}) {
    var conditions = Repository().setCondition();
    String? icon;
    conditions!.forEach((element) {
      if (element["code"] == day!.condition!.code) {
        icon =
        "images/weather/64x64/${hour!.isDay! ? "day" : "night"}/${element["icon"]}.png";
      }
    });
    return icon;
  }
}
