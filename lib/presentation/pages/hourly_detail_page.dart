import 'package:flutter/material.dart';
import 'package:weather_app/data/api/model/hourly.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/presentation/style/colors.dart';

import '../../const.dart';
import '../../utils.dart';

class HourlyDetailPage extends StatelessWidget {
  const HourlyDetailPage(
      {Key? key, required this.hourly, required this.timeZoneOffset})
      : super(key: key);

  final Hourly hourly;
  final int timeZoneOffset;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: WeatherAppColors.primary,
        appBar: AppBar(
          title: Text(
            Utils.createLastUpdateStr(hourly.dt, true, timeZoneOffset),
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
              child:
                  Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Image.network(
                      Utils.createImageLink(hourly.weather.first.icon),
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Text(S.of(context).error_no_cache_no_inet);
                      },
                    ),
                    Text(
                      hourly.weather.first.description,
                      style: theme.textTheme.headline6?.copyWith(
                        color: WeatherAppColors.base,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      hourly.temp.toString() + Const.sign,
                      style: theme.textTheme.headline3?.copyWith(
                        color: WeatherAppColors.base,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      S.of(context).feels_like +
                          hourly.feels_like.toString() +
                          Const.sign,
                      style: theme.textTheme.headline6?.copyWith(
                        color: WeatherAppColors.base,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      S.of(context).humidity +
                          hourly.humidity.toString() +
                          "%",
                      style: theme.textTheme.headline6?.copyWith(
                        color: WeatherAppColors.base,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      S.of(context).clouds +
                          hourly.clouds.toString() +
                          "%",
                      style: theme.textTheme.headline6?.copyWith(
                        color: WeatherAppColors.base,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      S.of(context).pressure +
                          hourly.pressure.toString() +
                          " hPa",
                      style: theme.textTheme.headline6?.copyWith(
                        color: WeatherAppColors.base,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      S.of(context).dew_point +
                          hourly.dew_point.toString() +
                          Const.sign,
                      style: theme.textTheme.headline6?.copyWith(
                        color: WeatherAppColors.base,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      S.of(context).uvi +
                          hourly.uvi.toString(),
                      style: theme.textTheme.headline6?.copyWith(
                        color: WeatherAppColors.base,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      S.of(context).visibility +
                          hourly.visibility.toString(),
                      style: theme.textTheme.headline6?.copyWith(
                        color: WeatherAppColors.base,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      S.of(context).wind_speed +
                          hourly.wind_speed.toString(),
                      style: theme.textTheme.headline6?.copyWith(
                        color: WeatherAppColors.base,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      S.of(context).wind_deg +
                          hourly.wind_deg.toString(),
                      style: theme.textTheme.headline6?.copyWith(
                        color: WeatherAppColors.base,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
            )));
  }
}
