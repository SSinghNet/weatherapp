import 'package:weather/models/location_model.dart';
import 'package:weather/models/weather_data_model.dart';
import 'package:weather/services/location_service.dart';
import 'package:weather/services/weather_service.dart';

class AppService {
  static Future<Location> locationRes = LocationService.getCoordsFromLocation();
  static Future<WeatherData> weatherRes = Future(() => WeatherData.empty());

  static Future<void> getData() async {
    locationRes = LocationService.getCoordsFromLocation();
    await locationRes.then(
      (loc) => {
        weatherRes = WeatherService.getWeatherData(
          loc.latitude,
          loc.longitude,
          "mph",
          "inch",
        ),
      },
    );
  }
}
