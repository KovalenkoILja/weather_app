import 'package:auto_route/auto_route.dart';
import 'package:weather_app/presentation/pages/daily_detail_page.dart';
import 'package:weather_app/presentation/pages/home_screen.dart';
import 'package:weather_app/presentation/pages/home_wrap_page.dart';
import 'package:weather_app/presentation/pages/hourly_detail_page.dart';
import 'package:weather_app/presentation/pages/splash_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: HomeWrapperPage,
      initial: true,
      children: <AutoRoute>[
        AutoRoute(page: SplashScreen, initial: true),
        CustomRoute(page: HomeScreen, durationInMilliseconds: 0),
        AutoRoute(page: DailyDetailPage),
        AutoRoute(page: HourlyDetailPage),
      ],
    ),
  ],
)
class $WeatherAppRouter {}
