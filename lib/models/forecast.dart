import 'package:weather_app/models/forecast_day.dart';

class Forecast {
  List<ForecastDay>? forecasts = [];

  Forecast.fromJson(json) {
    if (json["forecastday"] != null) {
      json["forecastday"].forEach((f) {
        forecasts!.add(new ForecastDay.fromJson(f));
      });
    }
  }
}
