// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../data/api/model/daily.dart' as _i8;
import '../data/api/model/hourly.dart' as _i9;
import '../presentation/pages/daily_detail_page.dart' as _i4;
import '../presentation/pages/home_screen.dart' as _i3;
import '../presentation/pages/home_wrap_page.dart' as _i1;
import '../presentation/pages/hourly_detail_page.dart' as _i5;
import '../presentation/pages/splash_screen.dart' as _i2;

class WeatherAppRouter extends _i6.RootStackRouter {
  WeatherAppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeWrapperRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeWrapperPage());
    },
    SplashScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SplashScreen());
    },
    HomeScreen.name: (routeData) {
      return _i6.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i3.HomeScreen(),
          durationInMilliseconds: 0,
          opaque: true,
          barrierDismissible: false);
    },
    DailyDetailRoute.name: (routeData) {
      final args = routeData.argsAs<DailyDetailRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.DailyDetailPage(
              key: args.key,
              daily: args.daily,
              timeZoneOffset: args.timeZoneOffset));
    },
    HourlyDetailRoute.name: (routeData) {
      final args = routeData.argsAs<HourlyDetailRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.HourlyDetailPage(
              key: args.key,
              hourly: args.hourly,
              timeZoneOffset: args.timeZoneOffset));
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(HomeWrapperRoute.name, path: '/', children: [
          _i6.RouteConfig(SplashScreen.name,
              path: '', parent: HomeWrapperRoute.name),
          _i6.RouteConfig(HomeScreen.name,
              path: 'home-screen', parent: HomeWrapperRoute.name),
          _i6.RouteConfig(DailyDetailRoute.name,
              path: 'daily-detail-page', parent: HomeWrapperRoute.name),
          _i6.RouteConfig(HourlyDetailRoute.name,
              path: 'hourly-detail-page', parent: HomeWrapperRoute.name)
        ])
      ];
}

/// generated route for [_i1.HomeWrapperPage]
class HomeWrapperRoute extends _i6.PageRouteInfo<void> {
  const HomeWrapperRoute({List<_i6.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'HomeWrapperRoute';
}

/// generated route for [_i2.SplashScreen]
class SplashScreen extends _i6.PageRouteInfo<void> {
  const SplashScreen() : super(name, path: '');

  static const String name = 'SplashScreen';
}

/// generated route for [_i3.HomeScreen]
class HomeScreen extends _i6.PageRouteInfo<void> {
  const HomeScreen() : super(name, path: 'home-screen');

  static const String name = 'HomeScreen';
}

/// generated route for [_i4.DailyDetailPage]
class DailyDetailRoute extends _i6.PageRouteInfo<DailyDetailRouteArgs> {
  DailyDetailRoute(
      {_i7.Key? key, required _i8.Daily daily, required int timeZoneOffset})
      : super(name,
            path: 'daily-detail-page',
            args: DailyDetailRouteArgs(
                key: key, daily: daily, timeZoneOffset: timeZoneOffset));

  static const String name = 'DailyDetailRoute';
}

class DailyDetailRouteArgs {
  const DailyDetailRouteArgs(
      {this.key, required this.daily, required this.timeZoneOffset});

  final _i7.Key? key;

  final _i8.Daily daily;

  final int timeZoneOffset;
}

/// generated route for [_i5.HourlyDetailPage]
class HourlyDetailRoute extends _i6.PageRouteInfo<HourlyDetailRouteArgs> {
  HourlyDetailRoute(
      {_i7.Key? key, required _i9.Hourly hourly, required int timeZoneOffset})
      : super(name,
            path: 'hourly-detail-page',
            args: HourlyDetailRouteArgs(
                key: key, hourly: hourly, timeZoneOffset: timeZoneOffset));

  static const String name = 'HourlyDetailRoute';
}

class HourlyDetailRouteArgs {
  const HourlyDetailRouteArgs(
      {this.key, required this.hourly, required this.timeZoneOffset});

  final _i7.Key? key;

  final _i9.Hourly hourly;

  final int timeZoneOffset;
}
