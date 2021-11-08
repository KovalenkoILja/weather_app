import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:weather_app/domain/model/weather_data.dart';
import 'package:weather_app/domain/model/weather_fetch_params.dart';

abstract class RepositoryService with ChangeNotifier {
  WeatherFetchParam? fetchParam;

  WeatherData? weatherData;

  bool? isMenuShow;
  bool? isHourly;
  bool? isDaily;

  void showMenu(bool? isShow);

  void setHourly(bool? isDaily);

  void setDaily(bool? isHourly);

  Future<LatLng> determinePosition();

  Future<void> getWeather({WeatherFetchParam? fetchParam});
}
