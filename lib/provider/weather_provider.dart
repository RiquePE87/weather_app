import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/services/location_service.dart';
import 'package:weather_app/services/navigation_service.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/models/forecast_day.dart';
import 'package:weather_app/models/hour.dart';
import 'package:weather_app/models/weather.dart';

class WeatherProvider with ChangeNotifier {
  Weather? weather;
  List<Hour>? hourList;
  ForecastDay? forecastDay;
  List<Map>? conditions;
  bool? hasError = false;
  bool hasLocation = false;
  List<Weather>? searchList = [];
  LocationService? locationService;
  bool? isFarenheit = false;
  bool? isUKDefra = false;
  bool? isLoading = false;
  bool? hasConnection = true;

  WeatherProvider() {
    WeatherService().checkInternetConnection().then((value) {
      locationService = LocationService();
      hasConnection = value;
      notifyListeners();
      if (hasConnection == true) {
        startService();
      }
    });
  }

  void startService() {
    getLocationWeather();
    getDegreePref();
    getAirQualityPref();
  }

  Future<void> reloadLocation() async {
    getLocationWeather();
  }

  void setDegreePref(bool choice) async {
    final prefs = await SharedPreferences.getInstance();
    isFarenheit = choice;
    await prefs.setBool("isFarenheit", isFarenheit!);
    notifyListeners();
  }

  void getDegreePref() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("isFarenheit") != null)
      isFarenheit = prefs.getBool("isFarenheit");
  }

  void setAirQualityPref(bool choice) async {
    final prefs = await SharedPreferences.getInstance();
    isUKDefra = choice;
    await prefs.setBool("isUKDefra", isUKDefra!);
    notifyListeners();
  }

  void getAirQualityPref() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("isUKDefra") != null)
      isUKDefra = prefs.getBool("isUKDefra");
  }

  void getLocationWeather({String? location}) async {
    isLoading = true;
    notifyListeners();
    if (location == null) {
      await locationService!.getCoordinates().then((value) {
        location = value;
      });
    }

    WeatherService()
        .fetchWeather(location!, 7)
        .then((value) => weather = value)
        .whenComplete(() {
      isLoading = false;
      if (weather == null) {
        hasError = true;
        showSnack("Location not found!");
        notifyListeners();
      } else {
        setHourList();
        addLocation();
        if (searchList!.length > 1) {
          showSnack("Location changed to ${weather!.location!.name}");
        }
        notifyListeners();
      }
    });
  }

  void setHourList() {
    List<ForecastDay>? forecasts = weather!.forecast!.forecasts;
    DateTime actualDate = new DateTime.fromMillisecondsSinceEpoch(
        weather!.location!.localtimeEpoch!);

    forecasts?.forEach((element) {
      DateTime date =
          new DateTime.fromMillisecondsSinceEpoch(element.dateEpoch!);
      if (date.day == actualDate.day) {
        forecastDay = element;
        hourList = element.hour;
      }
    });
  }

  void addLocation() {
    searchList!.add(weather!);
    notifyListeners();
  }

  void removeLocation(Weather w) {
    searchList!.remove(w);
    notifyListeners();
  }

  void setLocation(Weather w) {
    weather = searchList!.firstWhere((element) => element == w);
    setHourList();
    if (searchList!.length > 1) {
      showSnack("Location changed to ${weather!.location!.name}");
    }
    notifyListeners();
  }

  bool isSelectedWeather(Weather w) {
    if (w == weather) {
      return true;
    } else {
      return false;
    }
  }

  void showSnack(String message) {
    final snackBar = SnackBar(
        backgroundColor: Color.fromARGB(255, 9, 11, 120),
        duration: Duration(milliseconds: 2000),
        content: Text(message));
    ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!)
        .showSnackBar(snackBar);
  }
}
