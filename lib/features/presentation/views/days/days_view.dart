
import 'package:burevi2/features/domain/entities/week_forecast_entity/response_week_forecast_entity.dart';
import 'package:burevi2/features/presentation/views/days/widgets/day_view_app_bar.dart';
import 'package:burevi2/features/presentation/views/days/widgets/week_forecast.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DaysPage extends StatefulWidget {
  const DaysPage({Key? key, this.weekForecastEntity}) : super(key: key);

  final ResponseWeekForecastEntity? weekForecastEntity;

  @override
  State<DaysPage> createState() => _DaysPageState();
}

class _DaysPageState extends State<DaysPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: dayViewAppBar(width, context,widget.weekForecastEntity!.timezone.toString()),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 18.0,
                ),
                child: Text(
                  "Next 7 Days",
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white
                  ),
                ),
              ),
              WeekForecast(height: height, width: width,weekForecastEntity: widget.weekForecastEntity,)
            ],
          ),
        ),
      ),
    );
  }


}
