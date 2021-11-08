part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class ShowSplashWithDelayEvent extends HomeEvent {}

class GetWeatherEvent extends HomeEvent {}