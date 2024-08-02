import 'package:flutter/material.dart';
import 'package:weather/models/weather_hourly_data_model.dart';
import 'package:weather/services/weather_service.dart';

class HourlyWeatherDay extends StatelessWidget {
  final WeatherHourlyData hourlyWeather;
  const HourlyWeatherDay({super.key, required this.hourlyWeather});

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
              "${hourlyWeather.temp}${WeatherService.getTempUnitText()}",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              "${hourlyWeather.getLocalTime().hour}:00",
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
