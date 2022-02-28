import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: RadialGradient(colors: [
          Color.fromARGB(255, 9, 80, 135),
          Color.fromARGB(255, 9, 11, 53),
        ], center: Alignment(0.8, -1.0), radius: 0.9)),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Farenheit",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                    Consumer<WeatherProvider>(
                      builder: (context, provider, child) {
                        return Checkbox(
                            value: provider.isFarenheit,
                            onChanged: (isChecked) {
                              provider.setDegreePref(isChecked!);
                            });
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Use UK Defra",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                    Consumer<WeatherProvider>(
                      builder: (context, provider, child) {
                        return Checkbox(
                            value: provider.isUKDefra,
                            onChanged: (isChecked) {
                              provider.setAirQualityPref(isChecked!);
                            });
                      },
                    )
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
