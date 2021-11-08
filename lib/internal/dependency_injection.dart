import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/data/services/localstorage_service.dart';
import 'package:weather_app/data/services/network_info.dart';
import 'package:weather_app/domain/services/repository_service.dart';
import 'package:weather_app/domain/services/storage_service.dart';
import 'package:weather_app/domain/services/weather_rep_service.dart';

import '../generated/l10n.dart';
import 'navigation.gr.dart';

final GetIt getIt = GetIt.instance;

class DependencyInjection {
  static void register() {
    getIt.registerSingleton<S>(S());
    getIt.registerSingleton<Dio>(Dio());
    getIt.registerSingleton<WeatherAppRouter>(WeatherAppRouter());
    getIt.registerSingleton<StorageService>(LocalStorageService());
    getIt.registerSingleton<RepositoryService>(WeatherRepService());
    getIt.registerLazySingleton<INetworkInfo>(
            () => NetworkInfo(connectivity: getIt()));
    getIt.registerLazySingleton(() => Connectivity());
  }
}
