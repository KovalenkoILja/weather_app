import 'package:latlng/latlng.dart';

class Const {
  static const bool appIsDebug = true;

  static const String headerAccept = "application/json";

  static const String openWeatherMapApiKey = "bc4b2146f2625505370932e9f94e1b11";

  static const String imgLogo = "assets/images/openweather.png";

  static const String baseUrl = "https://api.openweathermap.org/data/2.5/";

  static const String imageUrl = "http://openweathermap.org/img/wn/";

  static const Duration defaultAwaitTime = Duration(seconds: 3);

  static LatLng startPoint = LatLng(50.450001, 30.523333); //Kyiv

  static String formatDate = "E HH:mm:ss";

  static String sign = "℃";

}
