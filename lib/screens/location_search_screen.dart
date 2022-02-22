import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/screens/widgets/location_weather_card.dart';

class LocationSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String location = "";

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: RadialGradient(colors: [
                Color.fromARGB(255, 9, 80, 135),
                Color.fromARGB(255, 9, 11, 53),
              ], center: Alignment(0.8, -1.0), radius: 0.9)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  "Pick Location",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Consumer<WeatherProvider>(
                        builder: (context, provider, child) {
                          return TextField(
                            style: TextStyle(color: Colors.white54),
                            onSubmitted: (value) {
                              provider.getLocationWeather(value);
                            },
                            onChanged: (String value) {
                              location = value;
                            },
                            decoration: InputDecoration(
                                hintText: "Search",
                                hintStyle: TextStyle(color: Colors.white54),
                                fillColor: Color.fromARGB(255, 34, 34, 73),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                    BorderSide(color: Colors.transparent)),
                                icon: Icon(
                                  Icons.search_rounded,
                                  color: Colors.white,
                                )),
                          );
                        },
                      ),
                    ),
                  ),
                  Consumer<WeatherProvider>(
                    builder: (context, provider, child) {
                      return GestureDetector(
                        onTap: () {
                          provider.getLocationWeather(location);
                        },
                        child: Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 34, 34, 73),
                              borderRadius: BorderRadius.circular(10)),
                          width: 60,
                          height: 60,
                          child: Icon(
                            Icons.add_location_rounded,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
              Consumer<WeatherProvider>(
                builder: (context, provider, child) {
                  return SingleChildScrollView(
                    child: Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height,
                      child: GridView.builder(

                          itemCount: provider.searchList!.length,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1.3, crossAxisCount: 2),
                          itemBuilder: (_, index) {
                            return InkWell(
                              onTap: () {
                                provider.setLocation(provider.searchList![index]);
                              },
                              onLongPress: () {
                                provider
                                    .removeLocation(provider.searchList![index]);
                              },
                              child: LocationWeatherCard(
                                  provider.searchList![index],
                                  provider.isSelectedWeather(
                                      provider.searchList![index])),
                            );
                          }),
                    ),
                  );
                },
              )
              // Container(
              //   height: 600,
              //   child: Consumer<WeatherProvider>(
              //     builder: (context, provider, child) {
              //       return ListView.builder(
              //           scrollDirection: Axis.vertical,
              //           itemCount: provider.searchList!.length,
              //           itemBuilder: (_, index) {
              //             return LocationWeatherCard(
              //                 provider.searchList![index]);
              //           });
              //     },
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
