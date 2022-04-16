import 'package:burevi2/core/error/failure.dart';
import 'package:burevi2/core/usecase/usecase.dart';
import 'package:burevi2/features/domain/entities/current_weather_entity/response_current_weather_entity.dart';
import 'package:dartz/dartz.dart';

import '../../repositories/current_weather_repository/current_weather_repository.dart';

class   GetCurrentWeatherUseCase extends UseCase<ResponseCurrentWeatherEntity, NoParams>{
  final CurrentWeatherRepository? repository;

  GetCurrentWeatherUseCase({this.repository});

  @override
  Future<Either<Failure, ResponseCurrentWeatherEntity>> call(NoParams params) {
    return repository!.getCurrentWeatherData();
  }
}