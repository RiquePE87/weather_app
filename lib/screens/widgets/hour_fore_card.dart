import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/models/day.dart';
import 'package:weather_app/models/hour.dart';

class HourForeCard extends StatelessWidget {
  HourForeCard({this.day, this.hour});

  final Day? day;
  final Hour? hour;

  @override
  Widget build(BuildContext context) {
    String? icon = WeatherService().setConditionIcon(day: day, hour: hour);
    return Container(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
        color: hour!.isDay!
            ? Color.fromARGB(255, 26, 134, 230)
            : Color.fromARGB(255, 16, 18, 48),
        borderRadius: BorderRadius.circular(10),
        //border: Border.symmetric(vertical: BorderSide(style: BorderStyle.solid))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(icon!),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Column(
              children: [
                Text("${hour!.time!.substring(11, 16)}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
                Consumer<WeatherProvider>(
                  builder: (context, provider, child) {
                    return Text(provider.isFarenheit! ? "${hour!.tempF!.round()}ºF": "${hour!.tempC!.round()}ºC",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400));
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
