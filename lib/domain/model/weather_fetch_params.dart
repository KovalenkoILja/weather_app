class WeatherFetchParam {
  double latitude;
  double longitude;
  String apiKey;
  String? exclude;
  String? units;
  String? lang;

  WeatherFetchParam(
      {required this.apiKey,
      required this.latitude,
      required this.longitude,
      this.exclude,
      this.units,
      this.lang});
}
