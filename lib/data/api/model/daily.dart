import 'package:json_annotation/json_annotation.dart';

import 'feels_like.dart';
import 'temp.dart';
import 'weather.dart';

part 'daily.g.dart';

@JsonSerializable()
class Daily {
  int dt;
  int sunrise;
  int sunset;
  int moonrise;
  int moonset;
  double moon_phase;
  Temp temp;
  FeelsLike feels_like;
  int pressure;
  int humidity;
  double dew_point;
  double wind_speed;
  int wind_deg;
  double wind_gust;
  List<Weather> weather;
  int clouds;
  double pop;
  double? rain;
  double uvi;
  double? snow;

  Daily(
      {required this.dt,
      required this.sunrise,
      required this.sunset,
      required this.moonrise,
      required this.moonset,
      required this.moon_phase,
      required this.temp,
      required this.feels_like,
      required this.pressure,
      required this.humidity,
      required this.dew_point,
      required this.wind_speed,
      required this.wind_deg,
      required this.wind_gust,
      required this.weather,
      required this.clouds,
      required this.pop,
      required this.uvi, this.rain, this.snow});

  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);

  Map<String, dynamic> toJson() => _$DailyToJson(this);
}
