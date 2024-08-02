import 'package:flutter/material.dart';
import 'package:weather/components/daily_weather_day.dart';
import 'package:weather/models/location_model.dart';
import 'package:weather/models/weather_daily_data_model.dart';

class DailyWeather extends StatelessWidget {
  final List<WeatherDailyData> dailyWeather;
  final Location location;

  const DailyWeather(
      {super.key, required this.dailyWeather, required this.location});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Card(
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Daily Forecast:",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                height: 70,
                child: ListView.builder(
                  itemCount: dailyWeather.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    DateTime loc = dailyWeather[index].getLocalTime();
                    if (!(DateTime.now().year <= loc.year &&
                        DateTime.now().month <= loc.month &&
                        DateTime.now().day <= loc.day)) {
                      return const SizedBox.shrink();
                    }
                    return DailyWeatherDay(dailyWeather: dailyWeather[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
