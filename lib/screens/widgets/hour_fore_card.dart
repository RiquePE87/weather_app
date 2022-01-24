import 'package:flutter/material.dart';
import 'package:weather_app/models/condition.dart';
import 'package:weather_app/models/day.dart';
import 'package:weather_app/models/hour.dart';

class HourForeCard extends StatelessWidget {


  HourForeCard({this.day, this.hour,});

  Day? day;
  Hour? hour;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image(image: AssetImage("images/weather/64x64/${hour!.isDay! ? "day" : "night"}/${day!.condition!.code}.png"),),
          Column(
            children: [
              Text("${hour!.time}", style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500)),
              Text("${hour!.tempC}", style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w800)),
            ],
          )
        ],
      ),
    );
  }
}
