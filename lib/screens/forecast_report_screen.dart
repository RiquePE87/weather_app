import 'package:flutter/material.dart';
import 'package:weather_app/screens/widgets/forecast_day_list.dart';
import 'package:weather_app/screens/widgets/hour_by_hour_forecast_list.dart';

class ForecastRepostScreen extends StatelessWidget {
  const ForecastRepostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: RadialGradient(colors: [
            Color.fromARGB(100, 9, 80, 135),
            Color.fromARGB(100, 9, 11, 53),
          ], center: Alignment(0.8, -1.0), radius: 0.9)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                "weatherProvider.weather!.location!.name".toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Today',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
                Text('January, 27 2022',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
              ],
            ),
            HourByHourForecastList(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Next Forecast',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
                Icon(Icons.calendar_today_rounded, color: Colors.white,)
              ],
            ),
            ForecastDayList()
          ],
        ),
      ),
    );
  }
}