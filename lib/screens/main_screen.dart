import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/screens/widgets/hour_by_hour_forecast.dart';
import 'package:weather_app/screens/widgets/hour_fore_card.dart';
import 'package:weather_app/screens/widgets/info_column.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      backgroundColor: Color.fromARGB(100, 9, 11, 53),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              label: "",
              backgroundColor: Color.fromARGB(100, 9, 11, 53),
              icon: Icon(
                Icons.home_filled,
                color: Colors.white,
              )),
          BottomNavigationBarItem(
              label: "",
              backgroundColor: Color.fromARGB(100, 9, 11, 53),
              icon: Icon(
                Icons.search_rounded,
                color: Colors.white,
              )),
          BottomNavigationBarItem(
              label: "",
              backgroundColor: Color.fromARGB(100, 9, 11, 53),
              icon: Icon(
                Icons.insert_chart_outlined_rounded,
                color: Colors.white,
              )),
          BottomNavigationBarItem(
              label: "",
              backgroundColor: Color.fromARGB(100, 9, 11, 53),
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              )),
        ],
      ),
      body: SafeArea(
        child: Consumer<WeatherProvider>(
          builder: (context, provider, child) {
            return weatherProvider.weather != null ? Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Consumer<WeatherProvider>(
                      builder: (context, provider, child) {
                        return Text(
                          weatherProvider.weather!.location!.name.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 25),
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
                        color: Colors.blue
                    ),
                    width: 120,
                    height: 40,
                    child: Center(child: Text(
                        "Forecast", style: TextStyle(color: Colors.white))),
                  ),
                  Image(
                    image: AssetImage("images/thunderstorm.png"),
                    width: 200,
                    height: 200,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Consumer<WeatherProvider>(
                        builder: (context, provider, child) {
                          return InfoColumn(title: "Temp",
                              data: "${weatherProvider.weather!.current!
                                  .temperatureC.toString()}ªC");
                        },
                      ),
                      Consumer<WeatherProvider>(
                        builder: (context, provider, child) {
                          return InfoColumn(title: "Wind",
                              data: "${weatherProvider.weather!.current!.windKph
                                  .toString()} km/h");
                        },
                      ),
                      Consumer<WeatherProvider>(
                        builder: (context, provider, child) {
                          return InfoColumn(title: "Humidity",
                              data: "${weatherProvider.weather!.current!
                                  .humidity
                                  .toString()}%");
                        },
                      ),
                    ],
                  ),
                  Row(
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
                  HourByHourForecast()
                ],
              ),
            ) : Container(child: Center(child: CircularProgressIndicator(),),);
          },
        ),
      ),
    );
  }
}
