import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/services/localstorage_service.dart';
import 'package:weather_app/domain/services/repository_service.dart';
import 'package:weather_app/domain/services/storage_service.dart';

import 'generated/l10n.dart';
import 'internal/dependency_injection.dart';
import 'internal/navigation.gr.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  DependencyInjection.register();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = getIt<WeatherAppRouter>();
    return MaterialApp.router(
        routerDelegate: router.delegate(),
        routeInformationParser: router.defaultRouteParser(),
        onGenerateTitle: (context) => getIt<S>().app_name,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        builder: (_, widget) => SetupProviders(child: widget ?? Container()));
  }
}

class SetupProviders extends StatelessWidget {
  final Widget? child;

  const SetupProviders({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<StorageService>(
            create: (context) => getIt<LocalStorageService>()),
        ChangeNotifierProvider<RepositoryService>(
            create: (context) => getIt<RepositoryService>()),
      ],
      child: child!,
    );
  }
}
