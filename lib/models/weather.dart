import 'package:weather_app/models/current.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/models/location.dart';

class Weather {
  Location? location;
  Current? current;
  Forecast? forecast;

  Weather.fromJson(json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    current =
        json['current'] != null ? new Current.fromJson(json['current']) : null;
    forecast = json['forecast'] != null
        ? new Forecast.fromJson(json['forecast'])
        : null;
  }
}
