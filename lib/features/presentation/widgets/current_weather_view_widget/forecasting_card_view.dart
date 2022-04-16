import 'package:burevi2/core/constatnts/constants.dart';
import 'package:burevi2/features/domain/entities/current_weather_entity/response_current_weather_entity.dart';
import 'package:burevi2/features/domain/entities/week_forecast_entity/response_week_forecast_entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ForecastingCardView extends StatelessWidget {
  const ForecastingCardView({
    Key? key,
    this.width,
    this.height,
    this.weekForecastEntity,
  }) : super(key: key);

  final double? width;
  final ResponseWeekForecastEntity? weekForecastEntity;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: (height! * 0.15),
      child: ListView.builder(
          itemCount: weekForecastEntity!.hourly!.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var dt = DateTime.fromMillisecondsSinceEpoch(
                weekForecastEntity!.hourly![index].dt!.toInt());
            var d24 = DateFormat('HH:mm').format(dt); // 31/12/2000, 22:00
            print(weekForecastEntity!.hourly![index].weather![0].icon);
            return Card(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(d24.toString()),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: (height! * 0.015),
                      ),
                      child: weekForecastEntity!
                                  .hourly![index].weather![0].icon ==
                              null
                          ? Image.network(
                              "http://openweathermap.org/img/wn/04d.png",
                              height: 35)
                          : Image.network(
                              "$weatherIconUrl/${weekForecastEntity!.hourly![index].weather![0].icon}.png",
                              height: 35),
                    ),
                    Text(
                        "${(weekForecastEntity!.hourly![index].temp! - 273.15).round()}\u00b0"),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
