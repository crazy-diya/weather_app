import 'dart:convert';

import 'package:burevi2/core/constatnts/constants.dart';
import 'package:burevi2/core/error/exception.dart';
import 'package:burevi2/features/data/model/current_weather_model/request_current_weather_model.dart';
import 'package:burevi2/features/data/model/current_weather_model/response_current_weather_model.dart';
import 'package:burevi2/features/data/model/week_forecast_model/response_week_forecast_model.dart';
import 'package:http/http.dart' as http;

abstract class CurrentWeatherRemoteDataSource {
  Future<ResponseCurrentWeatherModel> getCurrentWeatherDetails();

  Future<ResponseWeekForecastModel> getWeekForecastDetails();
}



class CurrentWeatherRemoteDataSourceImpl extends CurrentWeatherRemoteDataSource {
  final http.Client? client;

  CurrentWeatherRemoteDataSourceImpl({this.client});

  @override
  Future<ResponseCurrentWeatherModel> getCurrentWeatherDetails() async {
    var response = await client?.get(Uri.parse(
        '$baseUrl/weather?lat=37.39&lon=-122.08&appid=c48cc178df6fe970fbe9d5fd1d9e697c'));
    // print(response);
    if (response?.statusCode == 200) {
      var data = json.decode(response!.body);
      // print(data);
      return ResponseCurrentWeatherModel.fromJson(data);
      // return data.map<ResponseCurrentWeatherModel>((json) => ResponseCurrentWeatherModel.fromJson(json)).toList(); // Methana Aul Poddak
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ResponseWeekForecastModel> getWeekForecastDetails() async {
    var response = await client?.get(Uri.parse(
        '$baseUrl/onecall?lat=37.39&lon=-122.08&exclude=alerts&appid=c48cc178df6fe970fbe9d5fd1d9e697c'));
    // print(response);
    if (response?.statusCode == 200) {
      var data = json.decode(response!.body);
      return ResponseWeekForecastModel.fromJson(data);
    } else {
      throw ServerException();
    }
  }




}
