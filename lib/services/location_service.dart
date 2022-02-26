import 'package:location/location.dart';

class LocationService {

  Location location = Location();

  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  Future<void> enableServices() async {
    _serviceEnabled = await location.serviceEnabled();
    if (_serviceEnabled! == false) {
      _serviceEnabled = await location.requestService();
      if (_serviceEnabled == true) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission().whenComplete(
              ()async => _locationData = await location.getLocation());
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    await location.getLocation().then((value) => _locationData = value);
  }

  Future<String> getCoordinates() async{
     await enableServices();
    String coord;
    if (_locationData != null)
      return coord =
          "${_locationData!.latitude!.toString()},${_locationData!.longitude}";
    else
      return "";
  }
}
