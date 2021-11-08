part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class IniHomeState extends HomeState {
  final BuildContext context;

  IniHomeState(this.context);
}

class ShowLoadingState extends HomeState {}

class ShowErrorState extends HomeState {
  final String errorMessage;

  ShowErrorState(this.errorMessage);
}

class ShowNoCacheNoConnectState extends HomeState {
}

class ShowWeatherState extends HomeState {}
