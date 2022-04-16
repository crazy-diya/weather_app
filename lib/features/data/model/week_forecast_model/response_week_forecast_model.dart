// To parse this JSON data, do
//
//     final responseWeekForecastModel = responseWeekForecastModelFromJson(jsonString);

import 'dart:convert';

import 'package:burevi2/features/domain/entities/week_forecast_entity/response_week_forecast_entity.dart';

ResponseWeekForecastModel responseWeekForecastModelFromJson(String str) =>
    ResponseWeekForecastModel.fromJson(json.decode(str));

String responseWeekForecastModelToJson(ResponseWeekForecastModel data) =>
    json.encode(data.toJson());

class ResponseWeekForecastModel extends ResponseWeekForecastEntity {
  ResponseWeekForecastModel({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.minutely,
    required this.hourly,
    required this.daily,
  }) : super(
          daily: daily,
          hourly: hourly,
          timezone: timezone,
        );

  final double lat;
  final double lon;
  final String timezone;
  final int timezoneOffset;

  final Current current;
  final List<Minutely> minutely;
  final List<Hourly> hourly;
  final List<Daily> daily;

  factory ResponseWeekForecastModel.fromJson(Map<String, dynamic> json) =>
      ResponseWeekForecastModel(
        lat: json["lat"] == null ? 1.0 : (json["lat"] as double).toDouble(),
        lon: json["lon"] == null ? 1.0 : (json["lon"] as double).toDouble(),
        timezone: json["timezone"] ?? "",
        timezoneOffset: json["timezone_offset"] ?? 0,
        current: Current.fromJson(json["current"]),
        minutely: List<Minutely>.from(
            json["minutely"].map((x) => Minutely.fromJson(x))),
        hourly:
            List<Hourly>.from(json["hourly"].map((x) => Hourly.fromJson(x))),
        daily: List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
        "timezone_offset": timezoneOffset,
        "current": current.toJson(),
        "minutely": List<dynamic>.from(minutely.map((x) => x.toJson())),
        "hourly": List<dynamic>.from(hourly.map((x) => x.toJson())),
        "daily": List<dynamic>.from(daily.map((x) => x.toJson())),
      };
}

class Daily extends DailyForecastEntity {
  Daily({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.rain,
    required this.uvi,
  }) : super(
          dt: dt,
          temp: temp,
          weather: weather,
        );

  final int dt;
  final int sunrise;
  final int sunset;
  final int moonrise;
  final int moonset;
  final double moonPhase;

  final Temp temp;
  final FeelsLike feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double windSpeed;
  final int windDeg;
  final double windGust;

  final List<Weather> weather;
  final int clouds;
  final double pop;

  final double rain;
  final double uvi;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        dt: json["dt"] ?? 0,
        sunrise: json["sunrise"] ?? 0,
        sunset: json["sunset"] ?? 0,
        moonrise: json["moonrise"] ?? 0,
        moonset: json["moonset"] ?? 0,
        moonPhase: json["moon_phase"] == null
            ? 1.0
            : (json["moon_phase"] as double).toDouble(),
        temp: Temp.fromJson(json["temp"]),
        feelsLike: FeelsLike.fromJson(json["feels_like"]),
        pressure: json["pressure"] ?? 0,
        humidity: json["humidity"] ?? 0,
        dewPoint: json["dew_point"] == null
            ? 1.0
            : (json["dew_point"] as double).toDouble(),
        windSpeed: json["wind_speed"] == null
            ? 1.0
            : (json["wind_speed"] as double).toDouble(),
        windDeg: json["wind_deg"] ?? 0,
        windGust: json["wind_gust"] == null
            ? 1.0
            : (json["wind_gust"] as double).toDouble(),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        clouds: json["clouds"] ?? 0,
        pop: json["pop"] == null ? 1.0 : json["pop"].toDouble(),
        rain: json["rain"] == null ? 1.0 : json["rain"].toDouble(),
        uvi: json["uvi"] == null ? 1.0 : json["uvi"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "moonrise": moonrise,
        "moonset": moonset,
        "moon_phase": moonPhase,
        "temp": temp.toJson(),
        "feels_like": feelsLike.toJson(),
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "wind_gust": windGust,
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "clouds": clouds,
        "pop": pop,
        "rain": rain,
        "uvi": uvi,
      };
}

class FeelsLike {
  FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  final double day;
  final double night;
  final double eve;
  final double morn;

  factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
        day: json["day"] == null ? 1.0 : (json["day"] as double).toDouble(),
        night: json["night"] == null ? 1.0 : json["night"].toDouble(),
        eve: json["eve"] == null ? 1.0 : json["eve"].toDouble(),
        morn: json["morn"] == null ? 1.0 : json["morn"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}

class Temp extends TempForecastEntity {
  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  }) : super(min: min, max: max);

  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: json["day"] == null ? 1.0 : json["day"].toDouble(),
        min: json["min"] == null ? 1.0 : json["min"].toDouble(),
        max: json["max"] == null ? 1.0 : json["max"].toDouble(),
        night: json["night"] == null ? 1.0 : json["night"].toDouble(),
        eve: json["eve"] == null ? 1.0 : json["eve"].toDouble(),
        morn: json["morn"] == null ? 1.0 : json["morn"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "min": min,
        "max": max,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}

class Hourly extends HourlyForecastEntity {
  Hourly({
    required this.dt,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.pop,
    required this.rain,
  }) : super(dt: dt, temp: temp, weather: weather);

  final int dt;
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double uvi;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final double windGust;
  final List<Weather> weather;
  final double pop;
  final Rain rain;

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        dt: json["dt"] ?? 0,
        temp: json["temp"] == null ? 1.0 : json["temp"].toDouble(),
        feelsLike:
            json["feels_like"] == null ? 1.0 : json["feels_like"].toDouble(),
        pressure: json["pressure"] ?? 0,
        humidity: json["humidity"] ?? 0,
        dewPoint:
            json["dew_point"] == null ? 1.0 : json["dew_point"].toDouble(),
        uvi: json["uvi"] == null ? 1.0 : json["uvi"].toDouble(),
        clouds: json["clouds"] ?? 0,
        visibility: json["visibility"] ?? 0,
        windSpeed:
            json["wind_speed"] == null ? 1.0 : json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"] ?? 0,
        windGust:
            json["wind_gust"] == null ? 1.0 : json["wind_gust"].toDouble(),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        pop: json["pop"] == null ? 1.0 : json["pop"].toDouble(),
        rain: json["rain"] == null
            ? Rain(the1H: 1.0)
            : Rain.fromJson(json["rain"]),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "temp": temp,
        "feels_like": feelsLike,
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "uvi": uvi,
        "clouds": clouds,
        "visibility": visibility,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "wind_gust": windGust,
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "pop": pop,
        "rain": rain
      };
}

class Rain {
  Rain({
    required this.the1H,
  });

  final double the1H;

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        the1H: json["1h"] == null ? 1.0 : json["1h"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "1h": the1H,
      };
}

class Minutely {
  Minutely({
    required this.dt,
    required this.precipitation,
  });

  final int dt;
  final int precipitation;

  factory Minutely.fromJson(Map<String, dynamic> json) => Minutely(
        dt: json["dt"].toInt() ?? 0,
        precipitation: json["precipitation"].toInt() ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "precipitation": precipitation,
      };
}

class Current {
  Current({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.weather,
  });

  final double dt;
  final double sunrise;
  final double sunset;
  final double temp;
  final double feelsLike;
  final double pressure;
  final double humidity;
  final double dewPoint;
  final double uvi;
  final double clouds;
  final double visibility;
  final double windSpeed;
  final double windDeg;
  final List<Weather> weather;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        dt: json["dt"].toDouble() ?? 1.0,
        sunrise: json["sunrise"].toDouble() ?? 1.0,
        sunset: json["sunset"].toDouble() ?? 1.0,
        temp: json["temp"] == null ? 1.0 : json["temp"].toDouble(),
        feelsLike: json["feels_like"] == null ? 1.0 : json["feels_like"].toDouble(),
        pressure: json["pressure"].toDouble() ?? 1.0,
        humidity: json["humidity"].toDouble() ?? 1.0,
        dewPoint: json["dew_point"] == null ? 1.0 : json["dew_point"].toDouble(),
        uvi: json["uvi"].toDouble() ?? 1.0,
        clouds: json["clouds"].toDouble() ?? 1.0,
        visibility: json["visibility"].toDouble() ?? 1.0,
        windSpeed: json["wind_speed"] == null ? 1.0 : json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"].toDouble() ?? 1.0,
        weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "temp": temp,
        "feels_like": feelsLike,
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "uvi": uvi,
        "clouds": clouds,
        "visibility": visibility,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
      };
}

class Weather extends WeatherForecastEntity {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  }) : super(icon: icon);

  final double id;
  final String main;
  final String description;
  final String icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"].toDouble() ?? 1.0,
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
