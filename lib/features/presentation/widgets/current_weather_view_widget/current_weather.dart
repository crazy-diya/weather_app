import 'package:burevi2/features/domain/entities/current_weather_entity/response_current_weather_entity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'current_weather_data_unit.dart';

class CurrentWeather extends StatefulWidget {
  const CurrentWeather({
    Key? key,
    this.height,
    this.weather,
  }) : super(key: key);

  final double? height;
  final ResponseCurrentWeatherEntity? weather;

  @override
  State<CurrentWeather> createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    String formatter = DateFormat.MMMMEEEEd('en_US').format(now);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: (widget.height! * 0.02),
              bottom: (widget.height! * 0.015),
            ),
            child: Image.asset(
              "assets/images/cloudy.png",
              height: 50,
              width: 50,
            ),
          ),
          Text(
            widget.weather!.weather![0].description.toString(),
            style: GoogleFonts.lato(
              color: Colors.white70,
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: (widget.height! * 0.01),
            ),
            child: Text(
              formatter,
              style: GoogleFonts.lato(
                color: Colors.white38,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: (widget.height! * 0.015),
            ),
            child: Text(
              "${(widget.weather!.main!.temp! - 273.15).ceil()}\u00b0",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(
            color: Colors.white,
            thickness: 1,
            height: 0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: CurrentWeatherDataUnit(
                    image: "assets/images/09d.png",
                    height: widget.height!,
                    name: "WIND",
                    value: "${widget.weather!.wind!.speed.toString()}\u00b0"),
              ),
              // SizedBox(
              //   height: (widget.height! * 0.1),
              //   child: const VerticalDivider(
              //     color: Colors.white,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: CurrentWeatherDataUnit(
                    image: "assets/images/10d@2x.png",
                    height: widget.height!,
                    name: "FEELS LIKE",
                    value:
                        "${(widget.weather!.main!.feelsLike! - 273.15).ceil().toString()}kwj"),
              ),
            ],
          ),
          const Divider(
            color: Colors.white,
            thickness: 1,
            height: 0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: CurrentWeatherDataUnit(
                    image: "assets/images/13n.png",
                    height: widget.height!,
                    name: "INDEX UV",
                    value: "${widget.weather!.wind!.speed.toString()}kwj"),
              ),
              // SizedBox(
              //   height: (widget.height! * 0.1),
              //   child: const VerticalDivider(
              //     color: Colors.white,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: CurrentWeatherDataUnit(
                    image: "assets/images/50d.png",
                    height: widget.height!,
                    name: "PRESSURE",
                    value: "${widget.weather!.main!.pressure.toString()}mbar"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
