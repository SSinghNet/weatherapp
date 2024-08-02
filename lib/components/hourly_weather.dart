import 'package:flutter/material.dart';
import 'package:weather/components/hourly_weather_day.dart';
import 'package:weather/models/location_model.dart';
import 'package:weather/models/weather_hourly_data_model.dart';

class HourlyWeather extends StatelessWidget {
  final List<WeatherHourlyData> hourlyWeather;
  final Location location;

  const HourlyWeather(
      {super.key, required this.hourlyWeather, required this.location});
			
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
                "Hourly Forecast:",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                height: 70,
                child: ListView.builder(
                    itemCount: hourlyWeather.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      DateTime loc = hourlyWeather[index].getLocalTime();
                      if (!(DateTime.now().year <= loc.year &&
                          DateTime.now().month <= loc.month &&
                          DateTime.now().day <= loc.day)) {
                        return const SizedBox.shrink();
                      }
                      if (DateTime.now().day == loc.day &&
                          DateTime.now().hour > loc.hour) {
                        return const SizedBox.shrink();
                      }
                      return HourlyWeatherDay(
                          hourlyWeather: hourlyWeather[index]);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
