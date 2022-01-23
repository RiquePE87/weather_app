class Location {
  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  Location.fromJson(json) {
    this.name = json["name"];
    this.region = json["region"];
    this.country = json["country"];
    this.lat = json["lat"];
    this.lon = json["lon"];
    this.tzId = json["tz_id"];
    this.localtimeEpoch = json["localtime_epoch"];
    this.localtime = json["localtime"];
  }
}
