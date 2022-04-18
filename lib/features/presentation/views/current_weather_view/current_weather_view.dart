import 'dart:async';

import 'package:burevi2/core/constatnts/constants.dart';
import 'package:burevi2/features/domain/entities/current_weather_entity/response_current_weather_entity.dart';
import 'package:burevi2/features/domain/entities/week_forecast_entity/response_week_forecast_entity.dart';
import 'package:burevi2/features/presentation/blocs/current_weather_bloc/current_weather_bloc.dart';
import 'package:burevi2/features/presentation/widgets/current_weather_view_widget/week_and_hours_weather_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/service/dependency_injection.dart';
import '../../widgets/current_weather_view_widget/app_bar.dart';
import '../../widgets/current_weather_view_widget/current_weather_body.dart';

class CurrentWeatherView extends StatefulWidget {
  const CurrentWeatherView({Key? key}) : super(key: key);

  @override
  State<CurrentWeatherView> createState() => _CurrentWeatherViewState();
}

class _CurrentWeatherViewState extends State<CurrentWeatherView> {
  final bloc = sl<CurrentWeatherBloc>();
  bool loadedC = false;
  bool loadedW = false;
  bool error = false;
  String? errorMessage;

  ResponseCurrentWeatherEntity? res;
  ResponseWeekForecastEntity? week;

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    bloc.add(GetCurrentWeatherDataEvent());
    bloc.add(GetWeekForecastDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (_) => bloc,
        child: BlocListener<CurrentWeatherBloc, CurrentWeatherState>(
          listener: (context, state) {
            if (state is CurrentWeatherInitial) {
              setState(() {});
            } else if (state is CurrentWeatherLoadingState) {
              setState(() {
                loadedC = false;
              });
            } else if (state is WeekForecastLoadingState) {
              setState(() {
                loadedW = false;
              });
            } else if (state is CurrentWeatherLoadedState) {
              setState(() {
                res = state.responseCurrentWeatherEntity;
                loadedC = true;
              });
            } else if (state is WeekForecastLoadedState) {
              setState(() {
                week = state.responseWeekForecastEntity;
                loadedW = true;
                error = false;
              });
            } else if (state is CurrentWeatherErrorState) {
              setState(() {
                error = true;
                errorMessage = state.errorMessage.toString();
              });
            }
          },
          child: Scaffold(
            appBar: buildAppBar(),
            body: Column(
              children: [
                loadedC == true
                    ? Expanded(
                        flex: 7,
                        child: CurrentWeatherBody(
                            responseCurrentWeatherEntity: res),
                      )
                    : error == true
                        ? ErrorWidget(errorMessage!)
                        : const Center(
                            child: CupertinoActivityIndicator(
                                color: Colors.red, radius: 25)),
                loadedW == true
                    ? Expanded(
                        flex: 3,
                        child: WeekAndHoursWeatherSection(
                          weekForecastEntity: week,
                        ),
                      )
                    : error == true
                        ? ErrorWidget(errorMessage!)
                        : const Center(
                            child: CupertinoActivityIndicator(
                                color: Colors.red, radius: 25)),
                error == true ? ErrorWidget(errorMessage!) : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }

/*

  BlocProvider<CurrentWeatherBloc> buildBody() {
    return BlocProvider(
      create: (_) => bloc,
      child: BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
          builder: (context, state) {
        if (state is CurrentWeatherInitial) {
          _dispatchInit(context);
          return const Center(
              child: CupertinoActivityIndicator(color: Colors.red, radius: 25));
        } else if (state is CurrentWeatherLoadingState) {
          return const Center(
              child:
                  CupertinoActivityIndicator(color: Colors.green, radius: 25));
        } else if (state is CurrentWeatherLoadedState) {
          return CurrentWeatherBody(
              responseCurrentWeatherEntity: state.responseCurrentWeatherEntity);
        } else if (state is CurrentWeatherErrorState) {
          return ErrorWidget(state.errorMessage.toString());
        }
        return ErrorWidget("Unexpected Error occurred!");
      }),
    );
  }

  BlocProvider<CurrentWeatherBloc> buildBottom() {
    return BlocProvider(
      create: (_) => bloc,
      child: BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
        builder: (context, state) {
          if (state is CurrentWeatherInitial) {
            _dispatchInit2(context);
            return const Center(
                child:
                    CupertinoActivityIndicator(color: Colors.red, radius: 25));
          } else if (state is CurrentWeatherLoadingState) {
            return const Center(
                child: CupertinoActivityIndicator(
                    color: Colors.green, radius: 25));
          } else if (state is WeekForecastLoadedState) {
            return WeekAndHoursWeatherSection(
              weekForecastEntity: state.responseWeekForecastEntity,
            );
          } else if (state is CurrentWeatherErrorState) {
            return ErrorWidget(state.errorMessage.toString());
          }
          return ErrorWidget("Unexpected Error occurred!");
        },
      ),
    );
  }

  void _dispatchInit(context) {
    BlocProvider.of<CurrentWeatherBloc>(context)
        .add(GetCurrentWeatherDataEvent());
  }

  void _dispatchInit2(context) {
    BlocProvider.of<CurrentWeatherBloc>(context)
        .add(GetWeekForecastDataEvent());
  }

  */

}
