import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/main_screen_provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/screens/widgets/bottom_navigation.dart';
import 'package:weather_app/screens/widgets/forecast_day_list.dart';
import 'package:weather_app/screens/widgets/hour_by_hour_forecast_list.dart';

class ForecastRepostScreen extends StatelessWidget {
  const ForecastRepostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: RadialGradient(colors: [
            Color.fromARGB(255, 9, 80, 135),
            Color.fromARGB(255, 9, 11, 53),
          ], center: Alignment(0.8, -1.0), radius: 0.9)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Consumer<WeatherProvider>(
                builder: (context, provider, child) {
                  return Text(
                    provider.weather!.location!.name.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  );
                },
              ),
            ),
            Padding(
              padding:const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Today',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                  Consumer<WeatherProvider>(
                    builder: (context, provider, child) {
                      return Text(
                          provider.weather!.current!.lastUpdated
                              .toString()
                              .substring(0, 10),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500));
                    },
                  ),
                ],
              ),
            ),
            HourByHourForecastList(),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Next Forecast',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                  Icon(
                    Icons.calendar_today_rounded,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Consumer<WeatherProvider>(
              builder: (context, provider, child) {
                return ForecastDayList(provider.weather!.forecast!.forecasts);
              },
            )
          ],
        ),
      ),
    );
  }
}
