import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/api/model/daily.dart';
import 'package:weather_app/data/api/model/hourly.dart';
import 'package:weather_app/domain/blocs/home_bloc.dart';
import 'package:weather_app/domain/services/repository_service.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/presentation/style/colors.dart';
import 'package:weather_app/presentation/widgets/current_weather.dart';
import 'package:weather_app/presentation/widgets/daily_weather_card.dart';
import 'package:weather_app/presentation/widgets/hourly_weather_card.dart';
import 'package:weather_app/presentation/widgets/hourly_weather_menu.dart';
import 'package:weather_app/presentation/widgets/loading_weather.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: WeatherAppColors.primary,
        appBar: AppBar(
          title: Text(
            S.of(context).app_name,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: WeatherAppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (state is ShowLoadingState) {
            return const LoadingWeather();
          } else if (state is ShowWeatherState) {
            return buildConsumer();
          } else if (state is ShowErrorState) {
            return Center(
              child: SingleChildScrollView(
                child: Text(
                  state.errorMessage,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headline2?.copyWith(
                    color: WeatherAppColors.base,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          } else if (state is ShowNoCacheNoConnectState) {
            return Center(
              child: SingleChildScrollView(
                child: Text(
                  S.of(context).error_no_cache_no_inet,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headline2?.copyWith(
                    color: WeatherAppColors.base,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          } else {
            return const LoadingWeather();
          }
        }));
  }

  Consumer<RepositoryService> buildConsumer() {
    return Consumer<RepositoryService>(
        builder: (context, _rs, widget) => SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            clipBehavior: Clip.none,
            child: Center(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              WeatherPopulated(weatherData: _rs.weatherData!),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => _rs.showMenu(_rs.isMenuShow),
                  child: Text(
                    S.of(context).display_mode,
                    style: Theme.of(context).textTheme.button?.copyWith(
                          color: WeatherAppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              WeatherMenu(
                show: (_rs.isMenuShow as bool),
              ),
                      const SizedBox(height: 10),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 210.0,
                      child: _rs.isHourly as bool
                          ? buildHourlyListView(_rs.weatherData!.hourly,
                              _rs.weatherData!.timezoneOffset)
                          : buildDailyListView(_rs.weatherData!.daily,
                              _rs.weatherData!.timezoneOffset)),
                ),
              )
            ]))));
  }

  ListView buildHourlyListView(List<Hourly> hourlyList, int timezoneOffset) {
    return ListView.builder(
      itemCount: hourlyList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => HourlyWeatherCard(
          hourly: hourlyList[index], timeZoneOffset: timezoneOffset),
    );
  }

  ListView buildDailyListView(List<Daily> dailyList, int timezoneOffset) {
    return ListView.builder(
      itemCount: dailyList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => DailyWeatherCard(
          daily: dailyList[index], timeZoneOffset: timezoneOffset),
    );
  }
}
