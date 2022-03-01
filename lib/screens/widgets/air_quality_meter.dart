import 'package:flutter/material.dart';

class AirQualityMeter extends StatelessWidget {

  final int? level;
  final List<Color>? levelColor;
  final List<String>? levelString;

  AirQualityMeter({this.level, this.levelString, this.levelColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(levelColor!.length > 6 ? "GbDefra":"US EPA ", style: TextStyle(color: Colors.white)),
        _createEPAMeter(),
            Text(" ${levelString![level! - 1]}",
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
    List<Widget> containerList = [];

    for (int i =0; i < levelColor!.length; i++){
      containerList.add(_createContainer(Colors.white));
    }

    for (int i = 0; i < level!; i++) {
      containerList[i] = _createContainer(levelColor![i]);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: containerList,
    );
  }
}
