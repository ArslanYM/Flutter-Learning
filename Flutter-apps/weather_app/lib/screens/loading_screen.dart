import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    Location currentLocation = Location();
    await currentLocation.getCurrentLocation();
    print(currentLocation.latitude);
  }

  void getData() async {
    Uri uri = Uri.https('samples.openweathermap.org', '/data/2.5/weather', {
      'lat': '39',
      'lon': '139',
      'appid': 'f33a484cf794d08d0148764789aaba32'
    });
    
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String data = response.body;
      var temperature = jsonDecode(data)['main']['temp'];
      var cNumber = jsonDecode(data)["weather"][0]['id'];
      var city = jsonDecode(data)['name'];

      print(temperature);
      print(cNumber);
      print(city);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
