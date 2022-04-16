import 'package:burevi2/core/network/network_info.dart';
import 'package:burevi2/features/data/repositories/current_weather_repository/current_weather_repository.dart';
import 'package:burevi2/features/domain/usecases/get_week_forecast_usecase/get_week_forecast_usecase.dart';
import 'package:burevi2/features/presentation/blocs/current_weather_bloc/current_weather_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../features/data/datasources/remote/current_weather_remote_data_source.dart';
import '../../features/domain/repositories/current_weather_repository/current_weather_repository.dart';
import '../../features/domain/usecases/get_current_weather_usecase/get_current_weather_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(
    () => CurrentWeatherBloc(
        weekForecastUseCase: sl(),
        currentWeatherUseCase: sl()),
  );

  sl.registerLazySingleton<CurrentWeatherRemoteDataSource>(
    () => CurrentWeatherRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<CurrentWeatherRepository>(
    () => CurrentWeatherRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => GetCurrentWeatherUseCase(
      repository: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => GetWeekForecastUseCase(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(),
  );

  sl.registerLazySingleton(
    () => http.Client(),
  );

  sl.registerLazySingleton(
    () => Connectivity(),
  );
}
