import 'package:weather_app/data/api/model/alerts.dart';
import 'package:weather_app/data/api/model/current.dart';
import 'package:weather_app/data/api/model/daily.dart';
import 'package:weather_app/data/api/model/hourly.dart';

class WeatherData {
  double lat;
  double lon;
  String timezone;
  int timezoneOffset;
  Current current;
  List<Hourly> hourly;
  List<Daily> daily;

  WeatherData({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.hourly,
    required this.daily,
  });
}
