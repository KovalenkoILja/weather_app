import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:weather_app/data/api/model/get_weather_response.dart';

import '../../const.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: Const.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  static const String accept = "application/json";

  @GET('/onecall')
  Future<GetWeatherResponse> getWeather({
    @Header("accept") required String accept,
    @Query("lat") required double latitude,
    @Query("lon") required double longitude,
    @Query("appid") required String apiKey,
    @Query("exclude") String? exclude,
    @Query("units") String? units,
    @Query("lang") String? lang,
  });
}
