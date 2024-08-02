// ignore_for_file: unnecessary_this, prefer_initializing_formals

class WeatherDailyData {
  final double maxTemp;
  final double minTemp;
  late final DateTime time;

  late final DateTime sunrise;
  late final DateTime sunset;

  WeatherDailyData({
    required this.maxTemp,
    required this.minTemp,
    required DateTime time,
    required DateTime sunrise,
    required DateTime sunset,
  }) {
    this.time = time;
    this.sunrise = sunrise;
    this.sunset = sunset;
  }

  DateTime getLocalTime() {
    return time.toLocal();
  }

  DateTime getLocalSunrise() {
    return sunrise.toLocal();
  }

  DateTime getLocalSunset() {
    return sunset.toLocal();
  }

  @override
  String toString() {
    return "$time: $maxTemp/$minTemp, sunrise: $sunrise, sunset: $sunset";
  }
}
