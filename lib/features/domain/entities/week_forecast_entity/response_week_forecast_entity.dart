class ResponseWeekForecastEntity {
  String? timezone;
  List<HourlyForecastEntity>? hourly;
  List<DailyForecastEntity>? daily;

  ResponseWeekForecastEntity({this.daily, this.hourly, this.timezone});
}

class HourlyForecastEntity {
  double? temp;
  int? dt;
  List<WeatherForecastEntity>? weather;

  HourlyForecastEntity({this.temp,this.dt,this.weather});
}

class WeatherForecastEntity {
  String? icon;

  WeatherForecastEntity({this.icon});
}

class DailyForecastEntity {
  int? dt;
  TempForecastEntity? temp;
  List<WeatherForecastEntity>? weather;

  DailyForecastEntity({this.temp, this.dt, this.weather});
}

class TempForecastEntity {
  double? min;
  double? max;

  TempForecastEntity({this.max, this.min});
}
