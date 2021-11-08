// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "app_name": MessageLookupByLibrary.simpleMessage("Weather app "),
        "by_days": MessageLookupByLibrary.simpleMessage("By days"),
        "by_the_hour": MessageLookupByLibrary.simpleMessage("By the hours"),
        "clouds": MessageLookupByLibrary.simpleMessage("Cloudiness "),
        "dew_point": MessageLookupByLibrary.simpleMessage("Dew point  "),
        "display_mode":
            MessageLookupByLibrary.simpleMessage("Switch display mode"),
        "error_no_cache_no_inet": MessageLookupByLibrary.simpleMessage(
            "Error! There are no cache and no Internet!"),
        "feels_like": MessageLookupByLibrary.simpleMessage("Feels like "),
        "humidity": MessageLookupByLibrary.simpleMessage("Humidity "),
        "last_update": MessageLookupByLibrary.simpleMessage("Last Updated at "),
        "location": MessageLookupByLibrary.simpleMessage("You are at "),
        "pressure": MessageLookupByLibrary.simpleMessage("Pressure  "),
        "sunrise": MessageLookupByLibrary.simpleMessage("Sunrise time "),
        "sunset": MessageLookupByLibrary.simpleMessage("Sunset time "),
        "temp": MessageLookupByLibrary.simpleMessage("Temperature "),
        "temp_day": MessageLookupByLibrary.simpleMessage("Day temperature "),
        "temp_eve":
            MessageLookupByLibrary.simpleMessage("Evening temperature "),
        "temp_max":
            MessageLookupByLibrary.simpleMessage("Max daily temperature "),
        "temp_min":
            MessageLookupByLibrary.simpleMessage("Min daily temperature "),
        "temp_morn":
            MessageLookupByLibrary.simpleMessage("Morning temperature "),
        "temp_night":
            MessageLookupByLibrary.simpleMessage("Night temperature "),
        "uvi": MessageLookupByLibrary.simpleMessage("Midday UV index "),
        "visibility": MessageLookupByLibrary.simpleMessage("Visibility "),
        "wind_deg": MessageLookupByLibrary.simpleMessage("Wind direction "),
        "wind_speed": MessageLookupByLibrary.simpleMessage("Wind speed ")
      };
}
