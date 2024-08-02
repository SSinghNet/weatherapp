import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:weather/models/location_model.dart';

class LocationService {
  static String locationQuery = "London";

  static Future<Location> getCoordsFromLocation() async {
    Map<String, String> queryParams = {
      "q": locationQuery,
      "appid": "957b28cf02c0b0a9e950cf0138106727",
    };
    Uri uri =
        Uri.https("api.openweathermap.org", "/geo/1.0/direct", queryParams);

    final response = await http.get(uri);

    if (jsonDecode(response.body).length < 1) {
      return Location(
        name: "Unknown",
        state: "Unknown",
        country: "Unknown",
        latitude: 0,
        longitude: 0,
      );
    }

    return Location.fromJson(
        jsonDecode(response.body)[0] as Map<String, dynamic>);
  }
}
