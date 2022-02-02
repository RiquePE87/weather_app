import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/main_screen_provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/screens/widgets/air_quality_panel.dart';
import 'package:weather_app/screens/widgets/hour_by_hour_forecast_list.dart';
import 'package:weather_app/screens/widgets/info_column.dart';
import 'package:weather_app/screens/widgets/weather_icon.dart';
import 'package:weather_app/screens/widgets/weather_panel.dart';

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
                                "${weatherProvider.weather!.location!.name.toString()}, ${weatherProvider.weather!.location!.region.toString()}",
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
                      Consumer<MainScreenProvider>(
                        builder: (context, provider, child) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  provider.onPanelTap(0);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: provider.selectedPanel == 0
                                          ? Colors.blue
                                          : Color.fromARGB(255, 16, 18, 48)),
                                  width: 120,
                                  height: 40,
                                  child: Center(
                                      child: Text("Forecast",
                                          style:
                                              TextStyle(color: Colors.white))),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  provider.onPanelTap(1);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: provider.selectedPanel == 1
                                          ? Colors.blue
                                          : Color.fromARGB(255, 16, 18, 48)),
                                  width: 120,
                                  height: 40,
                                  child: Center(
                                      child: Text("Air quality",
                                          style:
                                              TextStyle(color: Colors.white))),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      Consumer<MainScreenProvider>(
                        builder: (context, provider, child) {
                          return Container(
                            width: 300,
                            height: 250,
                            child: PageView(
                              physics: NeverScrollableScrollPhysics(),
                              controller: provider.panelController,
                              children: [
                                Consumer<WeatherProvider>(
                                  builder: (context, provider, child) {
                                    return WeatherPanel(provider.weather!);
                                  },
                                ),
                                Consumer<WeatherProvider>(
                                  builder: (context, provider, child) {
                                    return AirQualityPanel(provider.weather!);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
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
