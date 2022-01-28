import 'package:flutter/material.dart';
import 'package:weather_app/models/condition.dart';
import 'package:weather_app/repository/repository.dart';

class WeatherIcon extends StatelessWidget {
  WeatherIcon(this.condition, this.isDay, this.scale);

  Condition? condition;
  bool isDay;
  double scale;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      setWeatherIcon(),
      scale: scale,
    );
  }

  setWeatherIcon() {
    var conditions = Repository().setCondition();
    String? icon;
    conditions!.forEach((element) {
      if (element["code"] == condition!.code) {
        icon =
            "images/weather/64x64/${isDay ? "day" : "night"}/${element["icon"]}.png";
      }
    });
    return icon;
  }
}
