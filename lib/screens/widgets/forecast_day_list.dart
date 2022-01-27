import 'package:flutter/material.dart';

import 'forecast_day_card.dart';

class ForecastDayList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 6,
          itemBuilder: (_,index){
        return ForecastDayCard();
      }),
    );
  }
}
