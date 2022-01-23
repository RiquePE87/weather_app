import 'astro.dart';
import 'day.dart';
import 'hour.dart';

class ForecastDay {
  String? date;
  int? dateEpoch;
  Day? day;
  Astro? astro;
  List<Hour>? hour;

  ForecastDay.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dateEpoch = json['date_epoch'];
    day = json['day'] != null ? new Day.fromJson(json['day']) : null;
    astro = json['astro'] != null ? new Astro.fromJson(json['astro']) : null;
    if (json['hour'] != null) {
      hour = <Hour>[];
      json['hour'].forEach((v) {
        hour!.add(new Hour.fromJson(v));
      });
    }
  }
}
