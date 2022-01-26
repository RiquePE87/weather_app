import 'condition.dart';

class Current {
  int? lastUpdatedEpoch;
  String? lastUpdated;
  double? temperatureC;
  double? temperatureF;
  bool? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  String? windDirection;
  double? pressureMb;
  double? pressureIn;
  double? precipitationMm;
  double? precipitationIn;
  int? humidity;
  int? cloud;
  double? feelsLikeC;
  double? feelsLikeF;
  double? visibilityKm;
  double? visibilityMiles;
  double? uv;
  double? gustMph;
  double? gustKph;

  @override
  String toString() {
    return 'Weather{lastUpdatedEpoch: $lastUpdatedEpoch, lastUpdated: $lastUpdated, temperatureC: $temperatureC, temperatureF: $temperatureF, isDay: $isDay, condition: $condition, windMph: $windMph, windKph: $windKph, windDegree: $windDegree, windDirection: $windDirection, pressureMb: $pressureMb, pressureIn: $pressureIn, precipitationMm: $precipitationMm, precipitationIn: $precipitationIn, humidity: $humidity, cloud: $cloud, feelsLikeC: $feelsLikeC, feelsLikeF: $feelsLikeF, visibilityKm: $visibilityKm, visibilityMiles: $visibilityMiles, uv: $uv, gustMph: $gustMph, gustKph: $gustKph}';
  }

  // Map _setCondition(List condition) {}

  Current.fromJson(json) {
    this.lastUpdatedEpoch = json["last_updated_epoch"];
    this.lastUpdated = json["last_updated"];
    this.temperatureC = json["temp_c"];
    this.temperatureF = json["temp_f"];
    this.isDay = json["is_day"] == 1 ? true : false;
    this.condition = json['condition'] != null
        ? new Condition.fromJson(json['condition'])
        : null;
    this.windMph = json["wind_mph"];
    this.windKph = json["wind_kph"];
    this.windDegree = json["wind_degree"];
    this.windDirection = json["wind_dir"];
    this.pressureMb = json["pressure_mb"];
    this.pressureIn = json["pressure_in"];
    this.precipitationMm = json["precip_mm"];
    this.precipitationIn = json["precip_in"];
    this.humidity = json["humidity"];
    this.cloud = json["cloud"];
    this.feelsLikeC = json["feelslike_c"];
    this.feelsLikeF = json["feelslike_f"];
    this.visibilityKm = json["vis_km"];
    this.visibilityMiles = json["vis_miles"];
    this.uv = json["uv"];
    this.gustMph = json["gust_mph"];
    this.gustKph = json["gust_kph"];
  }
}
