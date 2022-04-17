import 'package:burevi2/core/constatnts/constants.dart';
import 'package:burevi2/features/domain/entities/current_weather_entity/response_current_weather_entity.dart';
import 'package:burevi2/features/domain/entities/week_forecast_entity/response_week_forecast_entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ForecastingCardView extends StatefulWidget {
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
  State<ForecastingCardView> createState() => ForecastingCardViewState();
}

class ForecastingCardViewState extends State<ForecastingCardView> {
  int clickPr = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: (widget.height! * 0.135),
      child: ListView.builder(
        itemCount: widget.weekForecastEntity!.hourly!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var dt = DateTime.fromMillisecondsSinceEpoch(
              widget.weekForecastEntity!.hourly![index].dt!.toInt());
          var d24 = DateFormat('HH:mm').format(dt); // 31/12/2000, 22:00
          return InkWell(
            onTap: () {
              setState(() {
                clickPr = index;
              });
            },
            child: clickPr == index
                ? Card(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black12,
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 10,
                    shadowColor: Colors.black,
                    color: Colors.blue,
                    child: Padding(
                      padding: EdgeInsets.all((widget.height! * 0.01)),
                      child: Column(
                        children: [
                          Text(d24.toString(),
                              style: TextStyle(color: Colors.white)),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: (widget.height! * 0.007),
                            ),
                            child: widget.weekForecastEntity!.hourly![index]
                                        .weather![0].icon ==
                                    null
                                ? Image.network(
                                    "http://openweathermap.org/img/wn/04d.png",
                                    height: 35)
                                : Image.network(
                                    "$weatherIconUrl/${widget.weekForecastEntity!.hourly![index].weather![0].icon}.png",
                                    height: 35),
                          ),
                          index == 0
                              ? Text(
                                  "Now",
                                  style: TextStyle(
                                      color: clickPr == 0
                                          ? Colors.white
                                          : Colors.black),
                                )
                              : Text(
                                  "${(widget.weekForecastEntity!.hourly![index].temp! - 273.15).round()}\u00b0",
                                  style: TextStyle(color: Colors.white),
                                ),
                        ],
                      ),
                    ),
                  )
                : Card(
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.black12,
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: EdgeInsets.all((widget.height! * 0.01)),
                      child: Column(
                        children: [
                          Text(
                            d24.toString(),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: (widget.height! * 0.007),
                            ),
                            child: widget.weekForecastEntity!.hourly![index]
                                        .weather![0].icon ==
                                    null
                                ? Image.network(
                                    "http://openweathermap.org/img/wn/04d.png",
                                    height: 35)
                                : Image.network(
                                    "$weatherIconUrl/${widget.weekForecastEntity!.hourly![index].weather![0].icon}.png",
                                    height: 35),
                          ),
                          index == 0
                              ? Text(
                                  "Now",
                                  style: TextStyle(
                                      color: clickPr == 0
                                          ? Colors.white
                                          : Colors.black),
                                )
                              : Text(
                                  "${(widget.weekForecastEntity!.hourly![index].temp! - 273.15).round()}\u00b0",
                                  style: const TextStyle(color: Colors.black),
                                ),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
