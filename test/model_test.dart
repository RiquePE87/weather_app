import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/Services/repository.dart';
import 'package:weather_app/models/weather.dart';

main() {
  test("test if returns the json", () async {
    final WeatherService repository = WeatherService();
    var result;

    await repository.fetchWeather("Recife", 3).then((value) => result = value);
    print(result);

    expect(result.runtimeType == Weather, true);
  });
}
