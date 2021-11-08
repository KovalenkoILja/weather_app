import 'package:json_annotation/json_annotation.dart';

part 'alerts.g.dart';

@JsonSerializable()
class Alerts {
  String senderName;
  String event;
  int start;
  int end;
  String description;
  List<String> tags;

  Alerts(
      {required this.senderName,
      required this.event,
      required this.start,
      required this.end,
      required this.description,
      required this.tags});

  factory Alerts.fromJson(Map<String, dynamic> json) => _$AlertsFromJson(json);

  Map<String, dynamic> toJson() => _$AlertsToJson(this);
}
