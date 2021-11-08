import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:weather_app/data/api/model/daily.dart';
import 'package:weather_app/domain/blocs/home_bloc.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/internal/navigation.gr.dart';
import 'package:weather_app/presentation/style/colors.dart';

import '../../const.dart';
import '../../utils.dart';

class DailyWeatherCard extends StatelessWidget {
  const DailyWeatherCard(
      {Key? key, required this.daily, required this.timeZoneOffset})
      : super(key: key);

  final Daily daily;
  final int timeZoneOffset;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              final ctx = context.read<HomeBloc>().context;
              StackRouter? router =
              AutoRouter.innerRouterOf(ctx, HomeWrapperRoute.name);
              router!.push(DailyDetailRoute(
                  daily: daily, timeZoneOffset: timeZoneOffset));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  Utils.createLastUpdateStr(daily.dt, true, timeZoneOffset),
                  style: theme.textTheme.bodyText1?.copyWith(
                    color: WeatherAppColors.base,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Image.network(
                  Utils.createImageLink(daily.weather.first.icon),
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Text(
                      S.of(context).error_no_cache_no_inet,
                      style: theme.textTheme.bodyText1?.copyWith(
                        color: WeatherAppColors.base,
                        fontWeight: FontWeight.normal,
                      ),
                    );
                  },
                ),
                Text(
                  daily.weather.first.description,
                  style: theme.textTheme.subtitle1?.copyWith(
                    color: WeatherAppColors.base,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  daily.temp.max.toString() +
                      Const.sign +
                      "/" +
                      daily.temp.min.toString() +
                      Const.sign,
                  style: theme.textTheme.subtitle1?.copyWith(
                    color: WeatherAppColors.base,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  daily.humidity.toString() + "%",
                  style: theme.textTheme.bodyText1?.copyWith(
                    color: WeatherAppColors.base,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
