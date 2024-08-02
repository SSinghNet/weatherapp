// ignore_for_file: unnecessary_this, prefer_initializing_formals

import 'dart:convert';

import 'package:flutter/services.dart';

class WeatherCurrentData {
  final double temp;
  final DateTime time;
  final int weatherCode;

  WeatherCurrentData({
    required this.temp,
    required DateTime time,
    required this.weatherCode,
  }) : this.time = time;

  Future<String> weatherCodeDesc() async {
    final String response =
        await rootBundle.loadString("assets/weatherCodes.json");
    final data = await json.decode(response);
    try {
      return data[weatherCode.toString()]["night"]["description"];
    } catch (error) {
      return "Unknown Weather Code";
    }
  }

  @override
  String toString() {
    return "${time.toLocal()}: $temp, Weather Code: $weatherCode";
  }
}
