import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather_app/services/condition.dart';
import 'package:weather_app/models/day.dart';
import 'package:weather_app/models/hour.dart';
import 'package:weather_app/models/weather.dart';

class WeatherService {
  final String urlBase = "http://api.weatherapi.com/v1/forecast.json?key=";
  final String key = "4611193cd03d47fb977132900222201";

  Future<dynamic> getHttp(String city, int days) async {
    String request = "$urlBase$key&q=$city&days=$days&aqi=yes&alerts=yes";

    var response;
    try {
      await Dio().get(request).then((value) {
        if (value.statusCode == 200) {
          response = value;
        }
      });
    } on DioError catch (e) {
      print(e.message);
      return null;
    }
    return response;
  }

  Future<bool> checkInternetConnection() async {
    return await InternetConnectionChecker().hasConnection;
  }

  Future<Weather?> fetchWeather(String city, int days) async {
    Weather? weather;
    var response;
    try {
      await getHttp(city, days)
          .then((value) => response = value)
          .onError((error, stackTrace) => true);
      if (response != null && response.statusCode == 200) {
        weather = Weather.fromJson(jsonDecode(response.toString()));
        //return weather;
      } else {
        throw Exception("Cannot fetch weather data");
      }
    } catch (ex) {}
    return weather;
  }

  setCondition() {
    var conditions = json.decode(CONDITIONS);
    return conditions;
  }

  String? setConditionIcon({Day? day, Hour? hour}) {
    var conditions = WeatherService().setCondition();
    String? icon;
    conditions!.forEach((element) {
      if (element["code"] == hour!.condition!.code) {
        icon =
            "images/weather/64x64/${hour.isDay! ? "day" : "night"}/${element["icon"]}.png";
      }
    });
    return icon;
  }
}
