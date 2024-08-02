import 'package:flutter/material.dart';
import 'package:weather/models/location_model.dart';
import 'package:weather/models/weather_current_data_model.dart';
import 'package:weather/services/weather_service.dart';

class CurrentWeather extends StatelessWidget {
  final WeatherCurrentData currentWeather;
  final Location location;

  const CurrentWeather(
      {super.key, required this.currentWeather, required this.location});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135,
      child: Card(
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "${currentWeather.temp}",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      Text(
                        " ${WeatherService.getTempUnitText()}",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                  const Spacer(),
                  FutureBuilder(
                    future: currentWeather.weatherCodeDesc(),
                    builder: (context, response) {
                      if (response.hasData) {
                        return Text(
                          response.data!,
                        );
                      } else if (response.hasError) {
                        return Text('${response.error}');
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons.location_on,
                          size: 16,
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                      Text(
                        location.state != ""
                            ? "${location.name}, ${location.state}, ${location.country}"
                            : "${location.name}, ${location.country}",
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
