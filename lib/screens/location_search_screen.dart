import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class LocationSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
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
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                          hintStyle: TextStyle(color: Colors.white54),
                          fillColor: Color.fromARGB(255, 34, 34, 73),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.transparent)),
                          icon: Icon(
                            Icons.search_rounded,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 34, 34, 73),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  width: 60,
                  height: 60,
                  child: Icon(
                    Icons.add_location_rounded,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Container(
              height: 500,
            )
          ],
        ),
      ),
    );
  }
}
