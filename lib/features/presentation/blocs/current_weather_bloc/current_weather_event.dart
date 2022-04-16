part of 'current_weather_bloc.dart';

abstract class CurrentWeatherEvent extends Equatable {
  const CurrentWeatherEvent();
}

class GetCurrentWeatherDataEvent extends CurrentWeatherEvent {
  @override
  List<Object?> get props => [];
}

class GetWeekForecastDataEvent extends CurrentWeatherEvent {
  @override
  List<Object?> get props => [];
}
