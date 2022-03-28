import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final List<String> data;
  final String image;

  InfoCard(this.data, this.image);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 6, left: 6),
            child: Image.asset(
              image,
              scale: 7,
            ),
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: data
                  .map((e) => Text(
                        e,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ))
                  .toList())
        ],
      ),
    );
  }
}
