import 'package:json_annotation/json_annotation.dart';

import 'alerts.dart';
import 'current.dart';
import 'daily.dart';
import 'hourly.dart';

part 'get_weather_response.g.dart';

@JsonSerializable()
class GetWeatherResponse {
  double lat;
  double lon;
  String timezone;
  @JsonKey(name: 'timezone_offset')
  int timezoneOffset;
  Current current;
  List<Hourly> hourly;
  List<Daily> daily;
  //List<Alerts>? alerts;

  GetWeatherResponse(
      {required this.lat,
      required this.lon,
      required this.timezone,
      required this.timezoneOffset,
      required this.current,
      required this.hourly,
      required this.daily});

  factory GetWeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$GetWeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetWeatherResponseToJson(this);
}
