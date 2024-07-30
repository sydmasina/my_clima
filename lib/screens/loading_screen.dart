import 'package:flutter/material.dart';
import 'package:my_clima/screens/location_screen.dart';
import 'package:my_clima/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

WeatherService weatherService = WeatherService();

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getWeather();
  }

  final spinkit = SpinKitSpinningLines(
    color: Colors.white,
    size: 100,
  );

  void getWeather() async {
    await weatherService.getCurrentWeather();

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LocationScreen(weatherService.weatherData)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: spinkit,
      ),
    );
  }
}
