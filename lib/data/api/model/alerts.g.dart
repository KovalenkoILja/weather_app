// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alerts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Alerts _$AlertsFromJson(Map<String, dynamic> json) => Alerts(
      senderName: json['senderName'] as String,
      event: json['event'] as String,
      start: json['start'] as int,
      end: json['end'] as int,
      description: json['description'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AlertsToJson(Alerts instance) => <String, dynamic>{
      'senderName': instance.senderName,
      'event': instance.event,
      'start': instance.start,
      'end': instance.end,
      'description': instance.description,
      'tags': instance.tags,
    };
