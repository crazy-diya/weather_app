import 'package:burevi2/features/presentation/blocs/current_weather_bloc/current_weather_bloc.dart';
import 'package:burevi2/features/presentation/widgets/current_weather_view_widget/week_and_hours_weather_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final bloc2 = sl<CurrentWeatherBloc>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body:  Column(
          children: [
            Expanded(flex: 7,child: buildBody()),
            Expanded(flex: 3,child: buildBottom()),
          ],
        ),
      ),
    );
  }
  BlocProvider<CurrentWeatherBloc> buildBody() {
    return BlocProvider(create: (_) => bloc,
      child: BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
          builder: (context, state) {
            if (state is CurrentWeatherInitial) {
              _dispatchInit(context);
              return const Center(child: CupertinoActivityIndicator(color: Colors.red,radius: 25));
            }else if(state is CurrentWeatherLoadingState){
              return const Center(child: CupertinoActivityIndicator(color: Colors.green,radius: 25));
            }else if(state is CurrentWeatherLoadedState){
              return CurrentWeatherBody(responseCurrentWeatherEntity: state.responseCurrentWeatherEntity);
            }else if(state is CurrentWeatherErrorState){
              return ErrorWidget(state.errorMessage.toString());
            }
            return ErrorWidget("Unexpected Error occurred!");
          }),);
  }

  BlocProvider<CurrentWeatherBloc> buildBottom() {
    return BlocProvider(create: (_) => bloc2,
    child: BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
      builder: (context, state) {
        if (state is CurrentWeatherInitial) {
          _dispatchInit2(context);
          return const Center(child: CupertinoActivityIndicator(color: Colors.red,radius: 25));
        }else if(state is CurrentWeatherLoadingState){
          return const Center(child: CupertinoActivityIndicator(color: Colors.green,radius: 25));
        }else if(state is WeekForecastLoadedState){
          return WeekAndHoursWeatherSection(weekForecastEntity: state.responseWeekForecastEntity,);
        }else if(state is CurrentWeatherErrorState){
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

  void _dispatchInit2(context){
    BlocProvider.of<CurrentWeatherBloc>(context)
        .add(GetWeekForecastDataEvent());
  }


}
