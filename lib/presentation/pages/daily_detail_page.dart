import 'package:flutter/material.dart';
import 'package:weather_app/data/api/model/daily.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/presentation/style/colors.dart';

import '../../const.dart';
import '../../utils.dart';

class DailyDetailPage extends StatelessWidget {
  const DailyDetailPage(
      {Key? key, required this.daily, required this.timeZoneOffset})
      : super(key: key);

  final Daily daily;
  final int timeZoneOffset;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: WeatherAppColors.primary,
        appBar: AppBar(
          title: Text(
            Utils.createLastUpdateStr(daily.dt, true, timeZoneOffset),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: WeatherAppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            clipBehavior: Clip.none,
            child: Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Image.network(
                  Utils.createImageLink(daily.weather.first.icon),
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Text(S.of(context).error_no_cache_no_inet);
                  },
                ),
                Text(
                  daily.weather.first.description,
                  style: theme.textTheme.headline6?.copyWith(
                    color: WeatherAppColors.base,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  color: WeatherAppColors.primary,
                  padding: const EdgeInsets.all(8.0),
                  child: Table(
                    border: TableBorder.all(color: WeatherAppColors.base),
                    children: [
                      TableRow(children: [
                        const Text(""),
                        Text(S.of(context).temp, textAlign: TextAlign.center),
                        Text(S.of(context).feels_like,
                            textAlign: TextAlign.center),
                      ]),
                      TableRow(children: [
                        Text(S.of(context).temp_morn,
                            textAlign: TextAlign.center),
                        Text(daily.temp.morn.toString(),
                            textAlign: TextAlign.center),
                        Text(daily.feels_like.morn.toString(),
                            textAlign: TextAlign.center),
                      ]),
                      TableRow(children: [
                        Text(S.of(context).temp_day,
                            textAlign: TextAlign.center),
                        Text(daily.temp.day.toString(),
                            textAlign: TextAlign.center),
                        Text(daily.feels_like.day.toString(),
                            textAlign: TextAlign.center),
                      ]),
                      TableRow(children: [
                        Text(S.of(context).temp_eve,
                            textAlign: TextAlign.center),
                        Text(daily.temp.eve.toString(),
                            textAlign: TextAlign.center),
                        Text(daily.feels_like.eve.toString(),
                            textAlign: TextAlign.center),
                      ]),
                      TableRow(children: [
                        Text(S.of(context).temp_night,
                            textAlign: TextAlign.center),
                        Text(daily.temp.night.toString(),
                            textAlign: TextAlign.center),
                        Text(daily.feels_like.night.toString(),
                            textAlign: TextAlign.center),
                      ]),
                      TableRow(children: [
                        Text(S.of(context).temp_min,
                            textAlign: TextAlign.center),
                        Text(daily.temp.min.toString(),
                            textAlign: TextAlign.center),
                        const Text(""),
                      ]),
                      TableRow(children: [
                        Text(S.of(context).temp_max,
                            textAlign: TextAlign.center),
                        Text(daily.temp.max.toString(),
                            textAlign: TextAlign.center),
                        const Text(""),
                      ]),
                    ],
                  ),
                ),
                Text(
                  S.of(context).sunrise +
                      Utils.createLastUpdateStr(
                          daily.sunrise, true, timeZoneOffset),
                  style: theme.textTheme.headline6?.copyWith(
                    color: WeatherAppColors.base,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  S.of(context).sunset +
                      Utils.createLastUpdateStr(
                          daily.sunset, true, timeZoneOffset),
                  style: theme.textTheme.headline6?.copyWith(
                    color: WeatherAppColors.base,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  S.of(context).humidity + daily.humidity.toString() + "%",
                  style: theme.textTheme.headline6?.copyWith(
                    color: WeatherAppColors.base,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  S.of(context).clouds + daily.clouds.toString() + "%",
                  style: theme.textTheme.headline6?.copyWith(
                    color: WeatherAppColors.base,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  S.of(context).pressure + daily.pressure.toString() + " hPa",
                  style: theme.textTheme.headline6?.copyWith(
                    color: WeatherAppColors.base,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  S.of(context).dew_point +
                      daily.dew_point.toString() +
                      Const.sign,
                  style: theme.textTheme.headline6?.copyWith(
                    color: WeatherAppColors.base,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  S.of(context).uvi + daily.uvi.toString(),
                  style: theme.textTheme.headline6?.copyWith(
                    color: WeatherAppColors.base,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  S.of(context).wind_speed + daily.wind_speed.toString(),
                  style: theme.textTheme.headline6?.copyWith(
                    color: WeatherAppColors.base,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  S.of(context).wind_deg + daily.wind_deg.toString(),
                  style: theme.textTheme.headline6?.copyWith(
                    color: WeatherAppColors.base,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            )));
  }
}
