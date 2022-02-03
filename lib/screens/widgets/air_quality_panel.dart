import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/screens/widgets/epa_meter.dart';

class AirQualityPanel extends StatelessWidget {
  Weather weather;

  AirQualityPanel(this.weather);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
              "CO: ${weather.current!.airQuality!.co!.round().toString()} μg/m3",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
          Text(
              "03: ${weather.current!.airQuality!.o3!.round().toString()} μg/m3",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
          Text(
              "NO2: ${weather.current!.airQuality!.no2!.round().toString()} μg/m3",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
          Text(
              "SO2: ${weather.current!.airQuality!.so2!.round().toString()} μg/m3",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
          Text(
              "PM 2.5: ${weather.current!.airQuality!.pm25!.round().toString()} μg/m3",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
          Text(
              "PM 10: ${weather.current!.airQuality!.pm10!.round().toString()} μg/m3",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
          EPAMeter(weather.current!.airQuality!.usEpaIndex!)
        ],
      ),
    );
  }
}
