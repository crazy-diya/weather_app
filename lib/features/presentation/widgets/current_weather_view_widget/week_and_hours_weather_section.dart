import 'package:burevi2/features/domain/entities/week_forecast_entity/response_week_forecast_entity.dart';
import 'package:burevi2/features/presentation/views/days/days_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'forecasting_card_view.dart';

class WeekAndHoursWeatherSection extends StatefulWidget {
  const WeekAndHoursWeatherSection({Key? key, this.weekForecastEntity})
      : super(key: key);

  final ResponseWeekForecastEntity? weekForecastEntity;

  @override
  State<WeekAndHoursWeatherSection> createState() =>
      _WeekAndHoursWeatherSectionState();
}

class _WeekAndHoursWeatherSectionState
    extends State<WeekAndHoursWeatherSection> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return widget.weekForecastEntity != null
        ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: (height * 0.03),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Today",
                          style: GoogleFonts.lato(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  DaysPage(weekForecastEntity: widget.weekForecastEntity),
                          )),
                          // onTap: () {},
                          child: Row(
                            children: [
                              Text(
                                "Next 7 Days ",
                                style: GoogleFonts.lato(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              const Icon(
                                Icons.navigate_next,
                                color: Colors.black54,
                                size: 28,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ForecastingCardView(width: width, height: height,weekForecastEntity: widget.weekForecastEntity, ),
                ],
              ),
          ),
        )
        : const Center(
            child: CupertinoActivityIndicator(
            radius: 35,
            animating: true,
            color: Colors.black,
          ));
  }
}
