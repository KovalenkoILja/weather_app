import 'package:weather_app/data/api/model/get_weather_response.dart';
import 'package:weather_app/domain/model/weather_data.dart';

extension WeatherMapper on GetWeatherResponse {
  WeatherData? toModel() => WeatherData(
      lat: lat,
      lon: lon,
      current: current,
      timezone: timezone,
      timezoneOffset: timezoneOffset,
      hourly: hourly,
      daily: daily);

  static GetWeatherResponse fromModel(WeatherData weatherData) =>
      GetWeatherResponse(
          lat: weatherData.lat,
          lon: weatherData.lon,
          current: weatherData.current,
          timezone: weatherData.timezone,
          timezoneOffset: weatherData.timezoneOffset,
          hourly: weatherData.hourly,
          daily: weatherData.daily);
}
