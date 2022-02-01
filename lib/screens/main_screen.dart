import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/main_screen_provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/screens/widgets/bottom_navigation.dart';
import 'package:weather_app/screens/widgets/hour_by_hour_forecast_list.dart';
import 'package:weather_app/screens/widgets/info_column.dart';
import 'package:weather_app/screens/widgets/weather_icon.dart';

class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Consumer<WeatherProvider>(
        builder: (context, provider, child) {
          return weatherProvider.weather != null
              ? Container(
                  decoration: BoxDecoration(
                      gradient: RadialGradient(colors: [
                    Color.fromARGB(255, 9, 80, 135),
                    Color.fromARGB(255, 9, 11, 53),
                  ], center: Alignment(0.8, -1.0), radius: 0.9)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Consumer<WeatherProvider>(
                          builder: (context, provider, child) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: Text(
                                weatherProvider.weather!.location!.name
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600),
                              ),
                            );
                          },
                        ),
                      ),
                      Center(
                        child: Consumer<WeatherProvider>(
                          builder: (context, provider, child) {
                            return Text(
                              weatherProvider.weather!.location!.localtime
                                  .toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            );
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue),
                        width: 120,
                        height: 40,
                        child: Center(
                            child: Text("Forecast",
                                style: TextStyle(color: Colors.white))),
                      ),
                      WeatherIcon(weatherProvider.weather!.current!.condition,
                          weatherProvider.weather!.current!.isDay!, 0.4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Consumer<WeatherProvider>(
                            builder: (context, provider, child) {
                              return InfoColumn(
                                  title: "Temp",
                                  data:
                                      "${weatherProvider.weather!.current!.temperatureC!.round().toString()}ªC");
                            },
                          ),
                          Consumer<WeatherProvider>(
                            builder: (context, provider, child) {
                              return InfoColumn(
                                  title: "Wind",
                                  data:
                                      "${weatherProvider.weather!.current!.windKph.toString()} km/h");
                            },
                          ),
                          Consumer<WeatherProvider>(
                            builder: (context, provider, child) {
                              return InfoColumn(
                                  title: "Humidity",
                                  data:
                                      "${weatherProvider.weather!.current!.humidity.toString()}%");
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Today',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500)),
                            Text('View full report',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                      ),
                      HourByHourForecastList()
                    ],
                  ),
                )
              : Container(
                  child: Center(

                    child: CircularProgressIndicator(),
                  ),
                );
        },
      ),
    );
  }
}
