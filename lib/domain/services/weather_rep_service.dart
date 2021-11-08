import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlng/latlng.dart';
import 'package:weather_app/data/api/api_client.dart';
import 'package:weather_app/data/api/mapper/weather_mapper.dart';
import 'package:weather_app/data/api/model/get_weather_response.dart';
import 'package:weather_app/domain/model/weather_data.dart';
import 'package:weather_app/domain/model/weather_fetch_params.dart';
import 'package:weather_app/domain/services/repository_service.dart';
import 'package:weather_app/internal/dependency_injection.dart';

import '../../const.dart';

class WeatherRepService with ChangeNotifier implements RepositoryService {
  @override
  late bool? isDaily;

  @override
  late bool? isHourly;

  @override
  late bool? isMenuShow;

  @override
  WeatherData? weatherData;

  final Dio _dio = getIt<Dio>();
  late ApiClient _apiClient;

  WeatherRepService() {
    _apiClient = ApiClient(_dio, baseUrl: Const.baseUrl);

    isMenuShow = false;
    isDaily = true;
    isHourly = false;
  }

  @override
  WeatherFetchParam? fetchParam;

  @override
  Future<void> getWeather({WeatherFetchParam? fetchParam}) async {
    print("* DataRepService.getWeather()");

    if (fetchParam != null) this.fetchParam = fetchParam;

    try {
      GetWeatherResponse? weatherResponse = await _apiClient.getWeather(
          accept: Const.headerAccept,
          latitude: this.fetchParam!.latitude,
          longitude: this.fetchParam!.longitude,
          lang: this.fetchParam!.lang,
          exclude: this.fetchParam!.exclude,
          units: this.fetchParam!.units,
          apiKey: Const.openWeatherMapApiKey);

      weatherData = weatherResponse.toModel();

    } on DioError catch (ex) {
      _dioError(ex);
      rethrow;
    }
  }

  void _dioError(DioError ex) {
    if (ex.type == DioErrorType.response) {
      print("* statusCode=${ex.response!.statusCode.toString()}");
      print("* uri=${ex.response!.requestOptions.uri}");
      print("* data=${ex.response!.data}");
    }
  }

  @override
  Future<LatLng> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Const.startPoint;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Const.startPoint;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Const.startPoint;
    }

    var position = await Geolocator.getCurrentPosition();
    return LatLng(position.latitude, position.longitude);
  }

  @override
  void setDaily(bool? isHourly) {
    isDaily = true;
    this.isHourly = false;
    notifyListeners();
  }

  @override
  void setHourly(bool? isDaily) {
    this.isDaily = false;
    isHourly = true;
    notifyListeners();
  }

  @override
  void showMenu(bool? isShow) {
    isMenuShow = !isShow!;
    notifyListeners();
  }

}
