import 'package:flutter/material.dart';

class InfoColumn extends StatelessWidget {

  InfoColumn({this.title, this.data});

  final String? title;
  final String? data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title!,
            style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w300)),
        Text(data!,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400))
      ],
    );
  }
}