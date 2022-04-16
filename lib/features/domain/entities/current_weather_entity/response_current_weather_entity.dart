class ResponseCurrentWeatherEntity {
  final int? dt;
  final ResponseCurrentWeatherWindEntity? wind;
  final List<ResponseCurrentWeatherWeatherEntity>? weather;
  final ResponseCurrentWeatherMainEntity? main;
  final ResponseCurrentWeatherCoordEntity? coord;

  ResponseCurrentWeatherEntity({
    this.dt,
    this.wind,
    this.weather,
    this.main,
    this.coord,
  });
}

class ResponseCurrentWeatherWindEntity {
  final double? speed;

  ResponseCurrentWeatherWindEntity({
    this.speed,
  });
}

class ResponseCurrentWeatherWeatherEntity {
  final String? description;
  final String? icon;

  ResponseCurrentWeatherWeatherEntity({
    this.description,
    this.icon,
  });
}

class ResponseCurrentWeatherMainEntity {
  final double? temp;
  final double? feelsLike;
  final int? pressure;
  final int? humidity;

  ResponseCurrentWeatherMainEntity({
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
  });
}

class ResponseCurrentWeatherCoordEntity {
  final double? lon;
  final double? lat;

  ResponseCurrentWeatherCoordEntity({
    this.lon,
    this.lat,
  });
}
