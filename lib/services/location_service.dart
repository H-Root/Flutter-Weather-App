import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<bool> requestPermission() async {
    await Geolocator.requestPermission();
    final granted = await Geolocator.checkPermission();
    return granted == LocationPermission.whileInUse ||
        granted == LocationPermission.always;
  }

  Future<Position> getLocation() async {
    final currentLocation = Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
      timeLimit: const Duration(seconds: 30),
    );
    return currentLocation;
  }

  Future<String> getLocationLocality({required lat, required lon}) async {
    try {
      final getLocationName = await placemarkFromCoordinates(
        lat,
        lon,
        localeIdentifier: "en",
      );

      return getLocationName[0].locality ?? "Location Unknown";
    } catch (e) {
      print(e);
      return "Unknown Location";
    }
  }
}
