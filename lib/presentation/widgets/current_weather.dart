import 'package:flutter/material.dart';
import 'package:weather_app/domain/model/weather_data.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/presentation/style/colors.dart';
import 'package:weather_app/utils.dart';

import '../../const.dart';

class WeatherPopulated extends StatelessWidget {
  const WeatherPopulated({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  final WeatherData weatherData;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              S.of(context).location,
              style: theme.textTheme.bodyText1?.copyWith(
                color: WeatherAppColors.base,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              Utils.getFormattedLocationInDegree(
                  weatherData.lat, weatherData.lon),
              style: theme.textTheme.bodyText1?.copyWith(
                color: WeatherAppColors.base,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              weatherData.timezone,
              style: theme.textTheme.bodyText2?.copyWith(
                color: WeatherAppColors.base,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              S.of(context).last_update +
                  Utils.createLastUpdateStr(weatherData.current.dt, true,
                      weatherData.timezoneOffset),
              style: theme.textTheme.caption?.copyWith(
                color: WeatherAppColors.base,
                fontWeight: FontWeight.normal,
              ),
            ),
            Image.network(
              Utils.createImageLink(weatherData.current.weather.first.icon),
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Text(S.of(context).error_no_cache_no_inet);
              },
            ),
            Text(
              weatherData.current.weather.first.description,
              style: theme.textTheme.headline5?.copyWith(
                color: WeatherAppColors.base,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              weatherData.current.temp.toString() + Const.sign,
              style: theme.textTheme.headline2?.copyWith(
                color: WeatherAppColors.base,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              S.of(context).feels_like +
                  weatherData.current.feels_like.toString() +
                  Const.sign,
              style: theme.textTheme.headline6?.copyWith(
                color: WeatherAppColors.base,
                fontWeight: FontWeight.bold,
              ),
            ),
            /* Text(
              weatherData.current.weather.first.main,
              style: theme.textTheme.headline4?.copyWith(
                color: WeatherAppColors.base,
                fontWeight: FontWeight.bold,
              ),
            ),*/
            Text(
              S.of(context).humidity +
                  weatherData.current.humidity.toString() +
                  "%",
              style: theme.textTheme.headline6?.copyWith(
                color: WeatherAppColors.base,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              S.of(context).pressure +
                  weatherData.current.pressure.toString() +
                  " hPa",
              style: theme.textTheme.headline6?.copyWith(
                color: WeatherAppColors.base,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
