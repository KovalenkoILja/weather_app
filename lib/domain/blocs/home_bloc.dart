import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlng/latlng.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/data/services/network_info.dart';
import 'package:weather_app/domain/model/weather_fetch_params.dart';
import 'package:weather_app/domain/services/repository_service.dart';
import 'package:weather_app/domain/services/storage_service.dart';
import 'package:weather_app/internal/dependency_injection.dart';
import 'package:weather_app/internal/navigation.gr.dart';

import '../../const.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late BuildContext context;
  late RepositoryService _rs;
  late INetworkInfo _ni;
  late StorageService _ls;

  HomeBloc(initialState) : super(initialState) {
    if (initialState is IniHomeState) {
      context = initialState.context;
    }
    _rs = getIt<RepositoryService>();
    _ni = getIt<INetworkInfo>();
    _ls = getIt<StorageService>();
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    StackRouter? router =
        AutoRouter.innerRouterOf(context, HomeWrapperRoute.name);

    if (event is ShowSplashWithDelayEvent) {
      await Future.delayed(Duration(seconds: Const.defaultAwaitTime.inSeconds))
          .then((value) {
        router?.push(const HomeScreen());
        add(GetWeatherEvent());
      });
    } else if (event is GetWeatherEvent) {
      yield ShowLoadingState();
      if (await _ni.isConnected) {
        try {
          await _fetchWeather();
          _ls.weatherData = _rs.weatherData;
          await _ls.saveWeatherData();
          yield ShowWeatherState();
        } catch (e) {
          yield ShowErrorState(e.toString());
        }
      } else {
        try {
          var isSaved = await _ls.getWeatherData();
          if (isSaved) {
            _rs.weatherData = _ls.weatherData;
            yield ShowWeatherState();
          } else {
            print("* !No CACHE NO INTERNET! *");
            yield ShowNoCacheNoConnectState();
          }
        } catch (e) {
          yield ShowErrorState(e.toString());
        }
      }
    }
  }

  Future<void> _fetchWeather() async {
    LatLng latlng = await _rs.determinePosition();
    _rs.fetchParam = WeatherFetchParam(
        longitude: latlng.longitude,
        latitude: latlng.latitude,
        lang: Localizations.localeOf(context).languageCode,
        exclude: 'minutely',
        units: 'metric',
        apiKey: Const.openWeatherMapApiKey);
    await _rs.getWeather(fetchParam: _rs.fetchParam);
  }
}
