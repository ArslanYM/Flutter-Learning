import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;

  Future<void>1 getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
