import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:weather/models/weather_data_model.dart';

enum TEMPUNIT { fahrenheit, celsius }

class WeatherService {
  static TEMPUNIT tempUnit = TEMPUNIT.fahrenheit;

  static String getTempUnitText() {
    return tempUnit == TEMPUNIT.fahrenheit ? "°F" : "°C";
  }

  static Future<WeatherData> getWeatherData(
      latitude, longitude, windSpeedUnit, precipUnit) async {
    Map<String, String> queryParams = {
      "latitude": "$latitude",
      "longitude": "$longitude",
      "temperature_unit":
          tempUnit == TEMPUNIT.fahrenheit ? "fahrenheit" : "celsius",
      "wind_speed_unit": windSpeedUnit,
      "precipitation_unit": precipUnit,
      "current": "temperature_2m,weather_code,is_day",
      "hourly": "temperature_2m",
      "daily":
          "weather_code,temperature_2m_max,temperature_2m_min,sunrise,sunset",
    };

    Uri uri = Uri.https("api.open-meteo.com", "/v1/forecast", queryParams);

    final response = await http.get(uri);

    return WeatherData.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }
}
