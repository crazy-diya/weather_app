import 'package:burevi2/core/error/exception.dart';
import 'package:burevi2/core/error/failure.dart';
import 'package:burevi2/core/network/network_info.dart';
import 'package:burevi2/features/domain/entities/current_weather_entity/response_current_weather_entity.dart';
import 'package:burevi2/features/domain/entities/week_forecast_entity/response_week_forecast_entity.dart';
import 'package:burevi2/features/domain/repositories/current_weather_repository/current_weather_repository.dart';
import 'package:dartz/dartz.dart';

import '../../datasources/remote/current_weather_remote_data_source.dart';

class CurrentWeatherRepositoryImpl implements CurrentWeatherRepository {
  final NetworkInfo? networkInfo;
  final CurrentWeatherRemoteDataSource? remoteDataSource;

  CurrentWeatherRepositoryImpl({this.networkInfo, this.remoteDataSource});

  @override
  Future<Either<Failure, ResponseCurrentWeatherEntity>>
      getCurrentWeatherData() async {
    if (await networkInfo!.isConnected) {
      try {
        return Right(await remoteDataSource!.getCurrentWeatherDetails());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ResponseWeekForecastEntity>>
      getWeekWeatherData() async {
    if (await networkInfo!.isConnected) {
      try {
        return Right(await remoteDataSource!.getWeekForecastDetails());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
