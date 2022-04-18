part of 'current_weather_bloc.dart';

abstract class CurrentWeatherState extends Equatable {
  const CurrentWeatherState();
}

class CurrentWeatherInitial extends CurrentWeatherState {
  @override
  List<Object> get props => [];
}

class CurrentWeatherLoadingState extends CurrentWeatherState {
  @override
  List<Object> get props => [];
}

class CurrentWeatherLoadedState extends CurrentWeatherState {
  final ResponseCurrentWeatherEntity? responseCurrentWeatherEntity;

  const CurrentWeatherLoadedState({this.responseCurrentWeatherEntity});

  @override
  List<Object> get props => [responseCurrentWeatherEntity!];
}

class CurrentWeatherErrorState extends CurrentWeatherState {
  final String? errorMessage;

  const CurrentWeatherErrorState({this.errorMessage});

  @override
  List<Object> get props => [errorMessage!];
}

class WeekForecastLoadingState extends CurrentWeatherState {
  @override
  List<Object> get props => [];
}

class WeekForecastLoadedState extends CurrentWeatherState {
  final ResponseWeekForecastEntity? responseWeekForecastEntity;

  const WeekForecastLoadedState({this.responseWeekForecastEntity});

  @override
  List<Object?> get props => [responseWeekForecastEntity];
}
