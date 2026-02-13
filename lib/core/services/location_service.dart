import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:tascom/core/storage/shared_pref_helper.dart';

class LocationService {
  /// Fetches the current location as a "lat,long" string.
  /// Returns null if permission is denied or service is disabled.
  static Future<String?> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // 1. Check if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return null;
    }

    // 2. Get current position
    try {
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 10),
        ),
      );
      final location = '${position.latitude},${position.longitude}';
      await SharedPrefHelper.setUserLocation(location);
      return location;
    } catch (e) {
      return null;
    }
  }

  /// Reverse geocodes coordinates into a Placemark (country, city, etc.).
  /// Returns null if geocoding fails.
  static Future<Placemark?> getPlacemark(double latitude, double longitude) async {
    try {
      final placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        return placemarks.first;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
