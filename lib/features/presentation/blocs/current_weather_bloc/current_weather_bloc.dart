import 'package:burevi2/core/error/failure.dart';
import 'package:burevi2/core/usecase/usecase.dart';
import 'package:burevi2/features/domain/entities/current_weather_entity/response_current_weather_entity.dart';
import 'package:burevi2/features/domain/entities/week_forecast_entity/response_week_forecast_entity.dart';
import 'package:burevi2/features/domain/usecases/get_current_weather_usecase/get_current_weather_usecase.dart';
import 'package:burevi2/features/domain/usecases/get_week_forecast_usecase/get_week_forecast_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'current_weather_event.dart';

part 'current_weather_state.dart';

class CurrentWeatherBloc
    extends Bloc<CurrentWeatherEvent, CurrentWeatherState> {
  final GetCurrentWeatherUseCase currentWeatherUseCase;
  final GetWeekForecastUseCase weekForecastUseCase;

  CurrentWeatherBloc(
      {required this.weekForecastUseCase, required this.currentWeatherUseCase})
      : super(CurrentWeatherInitial());

  @override
  Stream<CurrentWeatherState> mapEventToState(
      CurrentWeatherEvent event) async* {
    if (event is GetCurrentWeatherDataEvent) {
      yield CurrentWeatherLoadingState();
      final failureOrCurrentWeatherData = await currentWeatherUseCase(NoParams());
      yield failureOrCurrentWeatherData.fold(
        (l) => CurrentWeatherErrorState(errorMessage: _mapFailureToMessage(l)),
        (r) => CurrentWeatherLoadedState(responseCurrentWeatherEntity: r),
      );
    } else if (event is GetWeekForecastDataEvent) {
      yield WeekForecastLoadingState();
      final failureOrWeekForecastData = await weekForecastUseCase(NoParams());
      yield failureOrWeekForecastData.fold(
        (l) => CurrentWeatherErrorState(errorMessage: _mapFailureToMessage(l)),
        (r) => WeekForecastLoadedState(responseWeekForecastEntity: r),
      );
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Server Failure";
      default:
        return 'Unexpected Error';
    }
  }
}
