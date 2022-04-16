import 'package:burevi2/core/error/failure.dart';
import 'package:burevi2/core/usecase/usecase.dart';
import 'package:burevi2/features/domain/entities/week_forecast_entity/response_week_forecast_entity.dart';
import 'package:burevi2/features/domain/repositories/current_weather_repository/current_weather_repository.dart';
import 'package:dartz/dartz.dart';

class GetWeekForecastUseCase extends UseCase<ResponseWeekForecastEntity, NoParams>{
  final CurrentWeatherRepository? repository;

  GetWeekForecastUseCase({this.repository});

  @override
  Future<Either<Failure, ResponseWeekForecastEntity>> call(NoParams params) {
    return repository!.getWeekWeatherData();
  }

}