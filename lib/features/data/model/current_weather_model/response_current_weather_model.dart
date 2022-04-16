// To parse this JSON data, do
//
//     final responseCurrentWeatherModel = responseCurrentWeatherModelFromJson(jsonString);

import 'package:burevi2/features/domain/entities/current_weather_entity/response_current_weather_entity.dart';
import 'dart:convert';

ResponseCurrentWeatherModel responseCurrentWeatherModelFromJson(String str) =>
    ResponseCurrentWeatherModel.fromJson(json.decode(str));

String responseCurrentWeatherModelToJson(ResponseCurrentWeatherModel data) =>
    json.encode(data.toJson());

class ResponseCurrentWeatherModel extends ResponseCurrentWeatherEntity {
  ResponseCurrentWeatherModel({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  }) : super(
          main: main,
          wind: wind,
          weather: weather,
          dt: dt,
          coord: coord,
        );

  final Coord coord;
  final List<Weather> weather;
  final String base;
  final Main main;
  final int visibility;
  final Wind wind;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  factory ResponseCurrentWeatherModel.fromJson(Map<String, dynamic> json) =>
      ResponseCurrentWeatherModel(
        coord: json["coord"] == null ? Coord(lat: 0,lon: 0): Coord.fromJson(json["coord"]) ,
        weather:json["weather"]==null? List.empty() : List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))) ,
        base: json["base"] ?? "",
        main: json["main"]==null ? Main(humidity: 1,feelsLike: 1.0,pressure: 1,temp: 1.21,tempMax: 12,tempMin: 1): Main.fromJson(json["main"]),
        visibility: json["visibility"]??0,
        wind: json["wind"] == null ? Wind(speed: 12.0,deg:02 ): Wind.fromJson(json["wind"]) ,
        clouds: json["clouds"] == null ? Clouds(all: 1): Clouds.fromJson(json["clouds"]),
        dt: json["dt"] ?? 0,
        sys: json["sys"] == null ? Sys(type: 1,country: "lll",id: 1,message: 12.0,sunrise: 1,sunset: 1):Sys.fromJson(json["sys"]),
        timezone: json["timezone"] ?? 0,
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        cod: json["cod"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "coord": coord.toJson(),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "base": base,
        "main": main.toJson(),
        "visibility": visibility,
        "wind": wind.toJson(),
        "clouds": clouds.toJson(),
        "dt": dt,
        "sys": sys.toJson(),
        "timezone": timezone,
        "id": id,
        "name": name,
        "cod": cod,
      };
}

class Clouds {
  Clouds({
    required this.all,
  });

  final int all;

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}

class Coord extends ResponseCurrentWeatherCoordEntity {
  Coord({
    required this.lon,
    required this.lat,
  }) : super(
          lon: lon,
          lat: lat,
        );

  final double lon;
  final double lat;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"] == null ? 1.0:(json["lon"] as double).toDouble() ,
        lat: json["lat"] == null ? 1.0 :(json["lat"] as double).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };
}

class Main extends ResponseCurrentWeatherMainEntity {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  }) : super(
          temp: temp,
          pressure: pressure,
          feelsLike: feelsLike,
          humidity: humidity,
        );

  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp:json["temp"] == null ? 1.0: (json["temp"] as double).toDouble() ,
        feelsLike:json["feels_like"] ==null ? 1.0 : (json["feels_like"] as double).toDouble(),
        tempMin: json["temp_min"] == null ? 1.0 : (json["temp_min"] as double).toDouble(),
        tempMax: json["temp_max"] == null ? 1.0 :(json["temp_max"] as double).toDouble(),
        pressure: json["pressure"] ?? 1,
        humidity: json["humidity"] ?? 1,
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
      };
}

class Sys {
  Sys({
    required this.type,
    required this.id,
    required this.message,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  final int type;
  final int id;
  final double message;
  final String country;
  final int sunrise;
  final int sunset;

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        type: json["type"] ?? 1,
        id: json["id"] ?? 1,
        message: json["message"] == null ? 1.0:(json["message"] as double).toDouble(),
        country: json["country"]??"",
        sunrise: json["sunrise"] ?? 1,
        sunset: json["sunset"] ?? 1,
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "message": message,
        "country": country,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

class Weather extends ResponseCurrentWeatherWeatherEntity {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  }) : super(
          icon: icon,
          description: description,
        );

  final int id;
  final String main;
  final String description;
  final String icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"] ?? 1,
        main: json["main"] ?? "",
        description: json["description"] ?? "",
        icon: json["icon"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}

class Wind extends ResponseCurrentWeatherWindEntity {
  Wind({
    required this.speed,
    required this.deg,
  }) : super(
          speed: speed,
        );

  final double speed;
  final int deg;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed:json["speed"] == null ? 1.0: (json["speed"] as double).toDouble(),
        deg: json["deg"] ?? 1,
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
      };
}
