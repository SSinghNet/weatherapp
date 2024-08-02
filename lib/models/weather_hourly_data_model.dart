// ignore_for_file: unnecessary_this, prefer_initializing_formals

class WeatherHourlyData {
  final double temp;
  final DateTime time;

  WeatherHourlyData({
    required this.temp,
    required DateTime time,
  }) : this.time = time;

  DateTime getLocalTime() {
    return time.toLocal();
  }

  @override
  String toString() {
    return "$time: $temp";
  }
}
