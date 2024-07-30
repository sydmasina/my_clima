import 'package:my_clima/services/location.dart';
import 'package:my_clima/utilities/fetch.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String? apiKey = dotenv.env['WEATHER_API_KEY'];
String? openWeatherMapUrl = dotenv.env['OPEN_WEATHER_MAP_URL'];
LocationService locationService = LocationService();

class WeatherService {
  var weatherData;

  Future getCurrentWeather() async {
    await locationService.getCurrentLocation();
    double lat = locationService.latitude;
    double lon = locationService.longitude;

    weatherData = await getData(
        '$openWeatherMapUrl?lat=$lat&lon=$lon&appid=$apiKey&units=metric');
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
