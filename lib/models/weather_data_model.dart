import 'package:weather/models/weather_current_data_model.dart';
import 'package:weather/models/weather_daily_data_model.dart';
import 'package:weather/models/weather_hourly_data_model.dart';

class WeatherData {
  late final double latitude;
  late final double longitude;

  late final WeatherCurrentData currentData;

  late final List<WeatherDailyData> dailyData;
  late final List<WeatherHourlyData> hourlyData;

  WeatherData({
    required this.latitude,
    required this.longitude,
    required this.currentData,
    required this.dailyData,
    required this.hourlyData,
  });

  WeatherData.empty() {
    latitude = 0;
    longitude = 0;
    currentData = WeatherCurrentData(temp: 0, time: DateTime.now(), weatherCode: -1);
    dailyData = [];
    hourlyData = [];
  }

  @override
  String toString() {
    return "@$latitude, $longitude:\ncurrent:\t\n$currentData\ndaily:\n\t$dailyData\nhourly:\n\t$hourlyData";
  }

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    List<WeatherDailyData> dailyData = [];
    List<WeatherHourlyData> hourlyData = [];

    for (int i = 0; i < json["daily"]["time"].length; i++) {
      WeatherDailyData data = WeatherDailyData(
        maxTemp: json["daily"]["temperature_2m_max"][i],
        minTemp: json["daily"]["temperature_2m_min"][i],
        time: DateTime.parse(json["daily"]["time"][i] + " 00:00:00 +00:00"),
        sunrise: DateTime.parse(json["daily"]["sunrise"][i] + "+00:00"),
        sunset: DateTime.parse(json["daily"]["sunset"][i] + "+00:00"),
      );
      dailyData.add(data);
    }

    for (int i = 0; i < json["hourly"]["time"].length; i++) {
      WeatherHourlyData data = WeatherHourlyData(
        temp: json["hourly"]["temperature_2m"][i],
        time: DateTime.parse(json["hourly"]["time"][i] + "+00:00"),
      );
      hourlyData.add(data);
    }

    WeatherCurrentData currentData = WeatherCurrentData(
      temp: json["current"]["temperature_2m"],
      time: DateTime.parse(json["current"]["time"] + "+00:00"),
      weatherCode: json["current"]["weather_code"],
    );

    return WeatherData(
      latitude: json["latitude"],
      longitude: json["longitude"],
      currentData: currentData,
      dailyData: dailyData,
      hourlyData: hourlyData,
    );
  }
}
