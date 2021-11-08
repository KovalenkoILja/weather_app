import 'package:weather_app/domain/services/weather_mixin.dart';

abstract class StorageService with WeatherMixin {

  Future<void> init();
  void close();
}