import 'package:json_annotation/json_annotation.dart';

import 'weather.dart';

part 'current.g.dart';

@JsonSerializable()
class Current {
  int dt;
  int sunrise;
  int sunset;
  double temp;
  double feels_like;
  int pressure;
  int humidity;
  double dew_point;
  double uvi;
  int clouds;
  int visibility;
  double wind_speed;
  int wind_deg;
  double wind_gust;
  List<Weather> weather;

  Current(
      {required this.dt,
      required this.sunrise,
      required this.sunset,
      required this.temp,
      required this.feels_like,
      required this.pressure,
      required this.humidity,
      required this.dew_point,
      required this.uvi,
      required this.clouds,
      required this.visibility,
      required this.wind_speed,
      required this.wind_deg,
      required this.wind_gust,
      required this.weather});

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}
