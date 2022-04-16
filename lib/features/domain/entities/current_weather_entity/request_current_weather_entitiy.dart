import 'package:burevi2/features/data/model/current_weather_model/request_current_weather_model.dart';

class RequestCurrentWeatherEntity extends RequestCurrentWeatherModel {
  double? lat;
  double? lon;
  String? apiKey;

  RequestCurrentWeatherEntity({this.lat, this.lon, this.apiKey})
      : super(lat: lat, lon: lon, apiKey: apiKey);
}
