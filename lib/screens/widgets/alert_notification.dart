import 'package:flutter/material.dart';
import 'package:weather_app/models/alert.dart';
import 'package:weather_app/services/navigation_service.dart';

class AlertNotification extends StatelessWidget {
  final List<Alert?> alerts;

  AlertNotification(this.alerts);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showAlertDialog();
      },
      child: CircleAvatar(
        maxRadius: 25,
        minRadius: 25,
        backgroundColor: Colors.black45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.warning,
              color: Colors.redAccent,
            ),
            Text("${alerts.length}"),
          ],
        ),
      ),
    );
  }

  void showAlertDialog() {
    showDialog(
        context: NavigationService.navigatorKey.currentState!.context,
        builder: (_) {
          return AlertDialog(
            title: Text("Weather Alerts"),
            scrollable: true,
            actionsAlignment: MainAxisAlignment.end,
            actions: [
              InkWell(
                onTap: () {
                  Navigator.of(_).pop();
                },
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              )
            ],
            backgroundColor: Colors.black45,
            content: Wrap(
              children: createAlert(alerts),
            ),
          );
        });
  }

  List<Widget> createAlert(List<Alert?> alerts) {
    List<Widget> alertTextList = [];
    alerts.forEach((element) {
      alertTextList.add(
        Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
              child: Icon(
                Icons.warning,
                color: Colors.redAccent,
              ),
            ),
            Text(
              element!.event!,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              element.desc!,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      );
    });

    return alertTextList;
  }
}
