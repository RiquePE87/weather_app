import 'package:flutter/material.dart';
import 'package:weather_app/models/weatherry.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Weather? weather;

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
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Text(
                  "Location",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              Center(
                child: Text(
                  "DateTime",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Image(
                image: AssetImage("images/thunderstorm.png"),
                width: 200,
                height: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("Temp",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500)),
                      Text("32",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w800))
                    ],
                  ),
                  Column(
                    children: [
                      Text("Wind",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500)),
                      Text("100km/h",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w800))
                    ],
                  ),
                  Column(
                    children: [
                      Text("Humidity",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500)),
                      Text("90%",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w800))
                    ],
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
