import '../screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location.dart';
import '../services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '71b0c1ea08475b14e18014854e3e159e';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    Location currentLocation = Location();

    await currentLocation.getCurrentLocation();
    latitude = currentLocation.latitude;
    longitude = currentLocation.longitude;

    Uri uri = Uri.https('samples.openweathermap.org', '/data/2.5/weather',
        {'lat': '$latitude', 'lon': '$longitude', 'appid': '$apiKey'});

    NetworkHelper networkHelper = NetworkHelper(uri);
    dynamic weatherData = networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return LocationScreen(locationWeather: weatherData);
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
