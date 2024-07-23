import 'package:geolocator/geolocator.dart';
import 'package:my_clima/constants/location.dart';

class LocationService {
  double latitude = kDefaultLat;
  double longitude = kDefaultLon;

  Future getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print(position);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
