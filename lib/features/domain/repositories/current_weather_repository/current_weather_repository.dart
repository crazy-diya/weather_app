import 'package:burevi2/core/error/failure.dart';
import 'package:burevi2/features/domain/entities/current_weather_entity/response_current_weather_entity.dart';
import 'package:burevi2/features/domain/entities/week_forecast_entity/response_week_forecast_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CurrentWeatherRepository {
  Future<Either<Failure, ResponseCurrentWeatherEntity>> getCurrentWeatherData();

  Future<Either<Failure, ResponseWeekForecastEntity>> getWeekWeatherData();
}
