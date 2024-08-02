import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather/components/current_weather.dart';
import 'package:weather/components/daily_weather.dart';
import 'package:weather/components/hourly_weather.dart';
import 'package:weather/models/location_model.dart';
import 'package:weather/models/weather_data_model.dart';
import 'package:weather/services/app_service.dart';
import 'package:weather/services/location_service.dart';
import 'package:weather/services/weather_service.dart';
import 'package:weather/themes.dart';

void main() => runApp(const MainApp());

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    AppService.getData().whenComplete(() => setState(() {}));
    timer = Timer.periodic(const Duration(minutes: 2),
        (timer) => AppService.getData().whenComplete(() => setState(() {})));
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weather",
      theme: Themes.myTheme,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).viewPadding.top + 10,
            left: 5,
            right: 5,
          ),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).viewPadding.top + 10),
              child: Column(
                children: [
                  Flexible(
                    child: Column(
											mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: FutureBuilder<List<Object>>(
                            future: Future.wait([
                              AppService.locationRes,
                              AppService.weatherRes
                            ]),
                            builder: (context, responses) {
                              if (responses.hasData &&
                                  (responses.data![1] as WeatherData)
                                          .currentData
                                          .weatherCode !=
                                      -1) {
                                WeatherData weatherData =
                                    (responses.data![1] as WeatherData);
                                Location location =
                                    (responses.data![0] as Location);
                                return Column(
                                  children: [
                                    CurrentWeather(
                                      currentWeather: weatherData.currentData,
                                      location: location,
                                    ),
                                    DailyWeather(
                                      dailyWeather: weatherData.dailyData,
                                      location: location,
                                    ),
                                    HourlyWeather(
                                      hourlyWeather: weatherData.hourlyData,
                                      location: location,
                                    ),
                                  ],
                                );
                              } else if (responses.hasError) {
                                return Text('${responses.error}');
                              }
                              return const CircularProgressIndicator();
                            },
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 200,
                              child: ListTile(
                                title: const Text('Fahrenheit'),
                                leading: Radio<TEMPUNIT>(
                                  value: TEMPUNIT.fahrenheit,
                                  groupValue: WeatherService.tempUnit,
                                  onChanged: (TEMPUNIT? value) {
                                    WeatherService.tempUnit = value!;
                                    AppService.getData()
                                        .whenComplete(() => setState(() {}));
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              child: ListTile(
                                title: const Text('Celsius'),
                                leading: Radio<TEMPUNIT>(
                                  value: TEMPUNIT.celsius,
                                  groupValue: WeatherService.tempUnit,
                                  onChanged: (TEMPUNIT? value) {
                                    WeatherService.tempUnit = value!;
                                    AppService.getData()
                                        .whenComplete(() => setState(() {}));
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        ListTile(
                          leading: const Text("Location: "),
                          title: SizedBox(
                            width: 400,
                            child: TextField(
                              onSubmitted: (String value) {
                                LocationService.locationQuery = value;
                                AppService.getData()
                                    .whenComplete(() => setState(() {}));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
