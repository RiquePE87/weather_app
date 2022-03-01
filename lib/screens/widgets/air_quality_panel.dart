import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/screens/widgets/air_quality_meter.dart';

class AirQualityPanel extends StatelessWidget {
  final Weather weather;

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
          Consumer<WeatherProvider>(
            builder: (context, provider, child) {
              return provider.isUKDefra! ? AirQualityMeter(
                level: weather.current!.airQuality!.gbDefraIndex,
                levelColor: [
                  Colors.green,
                  Colors.lightGreen,
                  Colors.lightGreen,
                  Colors.yellow,
                  Colors.yellow,
                  Colors.yellow.shade600,
                  Colors.orange.shade700,
                  Colors.orange.shade700,
                  Colors.red,
                  Colors.red
                ],
                  levelString: [
                    "Low",
                    "Low",
                    "Low",
                    "Moderate",
                    "Moderate",
                    "Moderate",
                    "High",
                    "High",
                    "High",
                    "Very High"
                  ],
              ) : AirQualityMeter(
                level: weather.current!.airQuality!.usEpaIndex!,
                levelString: [
                  "Good",
                  "Moderate",
                  "Unhealthy for sensitive group",
                  "Unhealthy",
                  "Very Unhealthy",
                  "Hazardous"
                ],

                levelColor: [
                  Colors.green,
                  Colors.lightGreen,
                  Colors.yellow,
                  Colors.yellow.shade600,
                  Colors.orange.shade700,
                  Colors.red
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
