import 'package:flutter/material.dart';
import 'package:weather/models/weather_daily_data_model.dart';
import 'package:weather/services/weather_service.dart';

class DailyWeatherDay extends StatelessWidget {
  final WeatherDailyData dailyWeather;
  const DailyWeatherDay({super.key, required this.dailyWeather});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${dailyWeather.maxTemp}${WeatherService.getTempUnitText()} | ${dailyWeather.minTemp}${WeatherService.getTempUnitText()}",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              "${dailyWeather.getLocalTime().month}/${dailyWeather.getLocalTime().day}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
