import 'package:burevi2/core/constatnts/constants.dart';
import 'package:burevi2/features/domain/entities/week_forecast_entity/response_week_forecast_entity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class WeekForecast extends StatefulWidget {
  const WeekForecast({
    Key? key,
    required this.height,
    required this.width,
    required this.weekForecastEntity,
  }) : super(key: key);

  final ResponseWeekForecastEntity? weekForecastEntity;

  final double height;
  final double width;

  @override
  State<WeekForecast> createState() => _WeekForecastState();
}

class _WeekForecastState extends State<WeekForecast> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height * 0.75,
      width: widget.width,
      child: ListView.builder(
        itemCount: widget.weekForecastEntity!.daily!.length,
        itemBuilder: (context, index) {
          var dt = DateTime.fromMillisecondsSinceEpoch(widget.weekForecastEntity!.daily![index].dt!);
          var dD = DateFormat('EEE,').format(dt);
          var dM = DateFormat('d MMM').format(dt);

          return ListTile(
            contentPadding: const EdgeInsets.only(left: 0),
            leading: widget.weekForecastEntity!.daily![index].weather![0].icon == null
                ? Image.network("http://openweathermap.org/img/wn/04d.png",
                    height: 35)
                : Image.network(
                    "$weatherIconUrl/${widget.weekForecastEntity!.daily![index].weather![0].icon}.png",
                    height: 35),
            title: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    dD.toString(),
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    dM.toString(),
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ),
            trailing: SizedBox(
              width: widget.width * 0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    (widget.weekForecastEntity!.daily![index].temp!.min! - 273.15)
                        .round()
                        .toString(),
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "/${(widget.weekForecastEntity!.daily![index].temp!.max! - 273.15).round().toString()}\u00b0",
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
