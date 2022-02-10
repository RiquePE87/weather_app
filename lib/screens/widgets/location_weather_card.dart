import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/screens/widgets/weather_icon.dart';

class LocationWeatherCard extends StatelessWidget {
  Weather weather;
  bool isSelected;

  LocationWeatherCard(this.weather, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          isSelected ? BoxShadow(color: Colors.white, blurRadius: 3, spreadRadius: 3) : BoxShadow()
        ],
          color: weather.current!.isDay!
              ? Color.fromARGB(255, 26, 134, 230)
              : Color.fromARGB(255, 16, 18, 48),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    width: 70,
                    child: Text(
                        "${weather.current!.temperatureC!.round().toString()}ºC",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w400)),
                  ),
                  Container(
                    width: 70,
                    child: Text("${weather.location!.name}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 8),
                child: WeatherIcon(
                    weather.current!.condition, weather.current!.isDay!, 0.8),
              )
            ],
          ),
          Text("${weather.location!.region}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400))
        ],
      ),
    );
  }
}
