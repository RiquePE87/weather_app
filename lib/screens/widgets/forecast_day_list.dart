import 'package:flutter/material.dart';
import 'package:weather_app/models/forecast_day.dart';

import 'forecast_day_card.dart';

class ForecastDayList extends StatelessWidget {
  ForecastDayList(this.forecasts);

  final List<ForecastDay>? forecasts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          itemCount: forecasts!.length,
          itemBuilder: (_, index) {
            return ForecastDayCard(forecasts![index]);
          }),
    );
  }
}
