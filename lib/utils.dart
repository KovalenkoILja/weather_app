import 'dart:core';

import 'package:intl/intl.dart';
import 'package:weather_app/const.dart';
import 'package:weather_app/data/services/network_info.dart';
import 'package:weather_app/internal/dependency_injection.dart';

class Utils {
  static DateTime unpackDate(int unixTime, bool isUtc) {
    int millis = unixTime * 1000;
    return DateTime.fromMillisecondsSinceEpoch(millis, isUtc: isUtc);
  }

  static DateTime utcToLocalByOffset(DateTime dateTime, int offset) {
    return dateTime.add(Duration(seconds: offset));
  }

  static String formatDate(DateTime dateTime) {
    final DateFormat formatter = DateFormat(Const.formatDate);
    return formatter.format(dateTime);
  }

  static String createLastUpdateStr(int unixTime, bool isUtc, int offset) {
    var lastUpdateDate = Utils.unpackDate(unixTime, true);
    lastUpdateDate =
        Utils.utcToLocalByOffset(lastUpdateDate, offset);
    return Utils.formatDate(lastUpdateDate);
  }

  static String createImageLink(String icon) {
    return Const.imageUrl + icon + '@2x.png';
  }

  static String getFormattedLocationInDegree(double latitude,
      double longitude) {
    int latSeconds = latitude.round() * 3600;
    int latDegrees = latSeconds ~/ 3600;
    latSeconds = latSeconds.abs() % 3600;
    int latMinutes = latSeconds ~/ 60;
    latSeconds %= 60;

    int longSeconds = longitude.round() * 3600;
    int longDegrees = longSeconds ~/ 3600;
    longSeconds = longSeconds.abs() % 3600;
    int longMinutes = longSeconds ~/ 60;
    longSeconds %= 60;
    String latDegree = latDegrees >= 0 ? "N" : "S";
    String lonDegrees = longDegrees >= 0 ? "E" : "W";

    return latDegrees.toString() + "°" + latMinutes.toString() + "'" +
        latSeconds.toString()
        + "\"" + latDegree + " " + longDegrees.toString() + "°" +
        longMinutes.toString()
        + "'" + longSeconds.toString() + "\"" + lonDegrees;
  }
}