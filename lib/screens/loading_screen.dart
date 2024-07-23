import 'package:flutter/material.dart';
import 'package:my_clima/services/location.dart';
import 'package:my_clima/services/weather.dart';

LocationService locationService = LocationService();
WeatherService weatherService = WeatherService();

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    getWeather();
  }

  void getLocation() async {
    await locationService.getCurrentLocation();
  }

  void getWeather() async {
    await weatherService.getCurrentWeather(
      lat: locationService.latitude,
      lon: locationService.longitude,
    );
    print(weatherService.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
