import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:weather_app/data/api/mapper/weather_mapper.dart';
import 'package:weather_app/data/api/model/get_weather_response.dart';
import 'package:weather_app/domain/model/weather_data.dart';
import 'package:weather_app/domain/services/storage_service.dart';

const String storageName = 'weather.json';
const String keyLastData = 'last_data';

class LocalStorageService implements StorageService {
  late GetWeatherResponse lastSavedWeather;

  static final _instance = LocalStorageService._internal();

  factory LocalStorageService() => _instance;

  LocalStorageService._internal();

  static LocalStorage? _storage;

  static bool _init = false;

  @override
  WeatherData? weatherData;

  Future<void> init() async {
    if (_init) return;
    print("* LocalStorageService.init");

    _init = true;
  }

  Future<bool> _localStorage() async {
    try {
      _storage ??= LocalStorage(storageName);
    } on Exception catch (e) {
      print("* LocalStorageService._localStorage: $e");
    }
    return await _storage?.ready ?? false;
  }

  @override
  Future<bool> getWeatherData() async {
    print("* LocalStorageService.getWeatherData()");
    bool res = false;
    if (await _localStorage()) {
      try {
        String? _json = _storage!.getItem(keyLastData);
        if (_json != null) {
          try {
            GetWeatherResponse getWeatherResponse =
                GetWeatherResponse.fromJson(json.decode(_json));
            weatherData = getWeatherResponse.toModel();
            res = true;
          } catch (e) {
            print(
                "* LocalStorageService.getWeatherData.Error: ${e.toString()}");
          }
        }
      } catch (e) {
        print("* LocalStorageService.Info: Error: $e");
      }
    }
    return res;
  }

  @override
  Future<bool> saveWeatherData() async {
    print("* LocalStorageService.saveWeatherData()");
    bool res = false;
    if (await _localStorage()) {
      try {
        GetWeatherResponse td = WeatherMapper.fromModel(weatherData!);
        String _json = json.encode(td.toJson());
        await _storage!.setItem(keyLastData, _json);
      } catch (e) {
        print("* LocalStorageService.saveWeatherData.Error: $e");
      }
    }
    return res;
  }

  @override
  Future<void> clearAllData() async {
    print("* LocalStorageService.clearAllData()");
    try {
      if (await _localStorage()) {
        _storage?.clear();
      }
    } catch (e) {
      print("* LocalStorageService.Error: $e");
    }
    weatherData = null;
  }

  @override
  void close() {}
}
