import 'package:burevi2/features/data/model/week_forecast_model/request_week_forecast_model.dart';

class RequestWeekForecastEntity extends RequestWeekForecastModel {
  String? lat;
  String? lon;
  String? part;
  String? apiKey;

  RequestWeekForecastEntity({this.apiKey, this.lat, this.lon, this.part})
      : super(lon: lon, lat: lat, part: part, apiKey: apiKey);
}
