class MainWeather {
  const MainWeather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  final num id;
  final String main;
  final String description;
  final String icon;
}

class Temperatures {
  const Temperatures({
    required this.temp,
    required this.tempMin,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
  });

  final num? temp;
  final num? tempMin;
  final num? feelsLike;
  final num? pressure;
  final num? humidity;
}

class WindState {
  const WindState({
    required this.speed,
    required this.degree,
    required this.gust,
  });

  final num? speed;
  final num? degree;
  final num? gust;
}

class Weather {
  const Weather({
    required this.weather,
    required this.mainTemperatures,
    required this.wind,
  });

  final MainWeather weather;
  final Temperatures mainTemperatures;
  final WindState wind;

  String get iconImage {
    switch (weather.icon) {
      // sunny
      case "01d":
        return "sun";
      case "01n":
        return "moon";
      case "02d":
        return "partly_cloudy_day";
      case "02n":
        return "moon_cloudy";
      case "03d":
      case "03n":
      case "04d":
      case "04n":
        return "cloudy";
      case "09d":
      case "10d":
        return "rainy_day";
      case "09n":
      case "10n":
        return "rainy_night";
      case "11d":
      case "11n":
        return "storm";
      case "13d":
        return "snowy_day";
      case "13n":
        return "snowy_night";
      case "50d":
      case "50n":
        return "cloudy";
      default:
        return "sun";
    }
  }

  factory Weather.fromJson(Map<String, dynamic> json) {
    // print(json['weather'][0]['main']);
    // print(json['weather'][0]['description']);
    // print(json['weather'][0]['icon']);
    // print(json['weather'][0]['id']);
    // print(json['wind']['speed']);
    // print(json['wind']['degree']);
    // print(json['wind']['gust']);

    // print(json['main']['temp']);
    // print(json['main']['temp_min']);
    // print(json['main']['feels_like']);
    // print(json['main']['pressure']);
    // print(json['main']['humidity']);

    return Weather(
      mainTemperatures: Temperatures(
        temp: json['main']['temp'],
        tempMin: json['main']['temp_min'],
        feelsLike: json['main']['feels_like'],
        pressure: json['main']['pressure'],
        humidity: json['main']['humidity'],
      ),
      weather: MainWeather(
        id: json['weather'][0]['id'],
        main: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        icon: json['weather'][0]['icon'],
      ),
      wind: WindState(
        speed: json['wind']['speed'],
        degree: json['wind']['degree'],
        gust: json['wind']['gust'],
      ),
    );
  }
}
