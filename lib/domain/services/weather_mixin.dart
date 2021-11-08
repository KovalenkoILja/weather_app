import 'package:weather_app/domain/model/weather_data.dart';

mixin WeatherMixin {
  WeatherData? weatherData;

  Future<bool> saveWeatherData();
  Future<bool> getWeatherData();

  Future<void> clearAllData();
}