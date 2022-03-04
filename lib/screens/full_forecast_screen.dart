import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/provider/weather_provider.dart';

class FullForecastScreen extends StatelessWidget {
  final Weather _weather;
  final TextStyle _title = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  FullForecastScreen(this._weather);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        backgroundColor: Color.fromARGB(255, 9, 11, 53),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(colors: [
          Color.fromARGB(255, 9, 80, 135),
          Color.fromARGB(255, 9, 11, 53),
        ], center: Alignment(0.8, -1.0), radius: 0.9)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Text(
              "${_weather.location!.name},"
              "\n"
              "${_weather.location!.region}",
              textAlign: TextAlign.center,
              style: _title,
            )),
            Consumer<WeatherProvider>(builder: ((context, provider, child) {
              return Text(
                provider.isFarenheit!
                    ? "${_weather.current!.temperatureF!.round()}ºF \n FellsLike ${_weather.current!.feelsLikeF!.round()}ºF"
                    : "${_weather.current!.temperatureC!.round()}ºC \n FeelsLike ${_weather.current!.feelsLikeC!.round()}ºC",
                style: _title,
                textAlign: TextAlign.center,
              );
            })),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 3),
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8, bottom: 8),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 16, 18, 48),
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.only(top: 8),
                    width: MediaQuery.of(context).size.width / 2,
                    height: 30,
                    child: Row(
                      children: [
                        Image.asset(
                          "images/cloud1.png",
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            children: [
                              Text(
                                "Humidity ${_weather.current!.humidity}%",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              Text(
                                "Clouds ${_weather.current!.cloud}%",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 16, 18, 48),
                        borderRadius: BorderRadius.circular(10)),
                    width: MediaQuery.of(context).size.width / 2,
                    child: Row(
                      children: [
                        Image.asset(
                          "images/wind.png",
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            children: [
                              Text(
                                "Wind ${_weather.current!.windKph!.round()}Kph",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              Text(
                                "Wind Dir. ${_weather.current!.windDegree}, ${_weather.current!.windDirection}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              Text(
                                "Pressure ${_weather.current!.pressureIn}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              Text(
                                "Gust ${_weather.current!.gustKph!.round()} kph",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 16, 18, 48),
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.only(top: 8),
                    margin: EdgeInsets.only(right: 8),
                    width: MediaQuery.of(context).size.width / 2,
                    height: 30,
                    child: Row(
                      children: [
                        Image.asset(
                          "images/rain3.png",
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            children: [
                              Text(
                                "Precipitation ${_weather.current!.humidity} ml",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              Text(
                                "Clouds ${_weather.current!.cloud}%",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
