import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/screens/widgets/info_card.dart';

class FullForecastScreen extends StatelessWidget {
  final Weather _weather;
  final TextStyle _title = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  final TextStyle _subTitle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  FullForecastScreen(this._weather);

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
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
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
                  style: _subTitle,
                  textAlign: TextAlign.center,
                );
              })),
              SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 2,
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  //mainAxisSpacing: 2,
                  //crossAxisSpacing: 2,
                  children: [
                    InfoCard([
                      "Wind ${_weather.current!.windKph!.round()}Kph",
                      "Wind Dir. ${_weather.current!.windDegree}, ${_weather.current!.windDirection}",
                      "Pressure ${_weather.current!.pressureIn!.round()} mb",
                      "Gust ${_weather.current!.gustKph!.round()} kph",
                    ], "images/wind.png"),
                    InfoCard([
                      "Precipitation ${_weather.current!.humidity} ml",
                      "Chance to Rain ${_weather.forecast!.forecasts![0].day!.dailyChanceOfRain}%",
                      "Clouds ${_weather.current!.cloud}%",
                    ], "images/rain3.png"),
                    InfoCard([
                      "Humidity ${_weather.current!.humidity}%",
                      "Clouds ${_weather.current!.cloud}%",
                    ], "images/cloud1.png"),
                    InfoCard([
                      "Sunrise ${_weather.forecast!.forecasts![0].astro!.sunrise}",
                      "Sunset ${_weather.forecast!.forecasts![0].astro!.sunset}"
                    ], "images/sunrise.png"),
                    InfoCard([
                      "Moonrise ${_weather.forecast!.forecasts![0].astro!.moonrise}",
                      "Moonset ${_weather.forecast!.forecasts![0].astro!.moonset}"
                    ], "images/night.png"),
                    InfoCard([
                      "Moon Phase ${_weather.forecast!.forecasts![0].astro!.moonPhase}",
                      "Moon Illumination ${_weather.forecast!.forecasts![0].astro!.moonIllumination}%"
                    ], "images/moon-phase.png"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
