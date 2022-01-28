import 'package:flutter/material.dart';
import 'package:weather_app/Services/weather_service.dart';
import 'package:weather_app/models/day.dart';
import 'package:weather_app/models/hour.dart';

class HourForeCard extends StatelessWidget {


  HourForeCard({this.day, this.hour});

  Day? day;
  Hour? hour;

  @override
  Widget build(BuildContext context) {
    String? icon = WeatherService().setConitionIcon(day: day, hour: hour);
    return Container(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
      padding: EdgeInsets.all(10),
      width: 120,
      decoration: BoxDecoration(
        color: hour!.isDay! ? Colors.blue : Colors.blue.shade900,
        borderRadius: BorderRadius.circular(10),
        //border: Border.symmetric(vertical: BorderSide(style: BorderStyle.solid))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(icon!),),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Column(
              children: [
                Text("${hour!.time!.substring(11,16)}", style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
                Text("${hour!.tempC!.round()}ºC", style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
