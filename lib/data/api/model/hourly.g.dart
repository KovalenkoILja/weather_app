// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hourly _$HourlyFromJson(Map<String, dynamic> json) => Hourly(
      dt: json['dt'] as int,
      temp: (json['temp'] as num).toDouble(),
      feels_like: (json['feels_like'] as num).toDouble(),
      pressure: json['pressure'] as int,
      humidity: json['humidity'] as int,
      dew_point: (json['dew_point'] as num).toDouble(),
      uvi: (json['uvi'] as num).toDouble(),
      clouds: json['clouds'] as int,
      visibility: json['visibility'] as int,
      wind_speed: (json['wind_speed'] as num).toDouble(),
      wind_deg: json['wind_deg'] as int,
      wind_gust: (json['wind_gust'] as num).toDouble(),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      pop: (json['pop'] as num).toDouble(),
    );

Map<String, dynamic> _$HourlyToJson(Hourly instance) => <String, dynamic>{
      'dt': instance.dt,
      'temp': instance.temp,
      'feels_like': instance.feels_like,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dew_point,
      'uvi': instance.uvi,
      'clouds': instance.clouds,
      'visibility': instance.visibility,
      'wind_speed': instance.wind_speed,
      'wind_deg': instance.wind_deg,
      'wind_gust': instance.wind_gust,
      'weather': instance.weather,
      'pop': instance.pop,
    };
