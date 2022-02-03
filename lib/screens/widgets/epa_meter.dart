import 'package:flutter/material.dart';

class EPAMeter extends StatelessWidget {
  int _level;
  List<Color> levelColor = [
    Colors.green,
    Colors.lightGreen,
    Colors.yellow,
    Colors.yellow.shade600,
    Colors.orange.shade700,
    Colors.red
  ];
  List<String> _levelString = [
    "Good",
    "Moderate",
    "Unhealthy for sensitive group",
    "Unhealthy",
    "Very Unhealthy",
    "Hazardous"
  ];

  EPAMeter(this._level);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("US EPA ", style: TextStyle(color: Colors.white)),
                _createEPAMeter(),
              ],
            ),
            Text(" ${_levelString[_level - 1]}",
                style: TextStyle(color: Colors.white)),
          ],
        ));
  }

  Container _createContainer(Color color) {
    return new Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          color: color,
          border:
              Border.fromBorderSide(BorderSide(color: Colors.grey, width: 1))),
    );
  }

  Widget _createEPAMeter() {
    List<Widget> containerList = [
      _createContainer(Colors.white),
      _createContainer(Colors.white),
      _createContainer(Colors.white),
      _createContainer(Colors.white),
      _createContainer(Colors.white),
      _createContainer(Colors.white),
    ];

    for (int i = 0; i < _level; i++) {
      containerList[i] = _createContainer(levelColor[i]);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: containerList,
    );
  }
}
