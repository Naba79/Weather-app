import 'dart:convert';

class WeatherModel {
  final String cityName;
  final double temperature;
  final double feelsLike;
  final int humidity;
  final double windSpeed;
  final int pressure;
  final int visibility;
  final int clouds;
  final String description;
  final String icon;

  WeatherModel({required this.cityName, required this.temperature, required this.feelsLike, required this.humidity, required this.windSpeed, required this.pressure, required this.visibility, required this.clouds, required this.description, required this.icon});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperature: (json['main']['temp'] as num).toDouble(),
      feelsLike: (json['main']['feels_like'] as num).toDouble(),
      humidity: json['main']['humidity'],
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      pressure: json['main']['pressure'],
      visibility: json['visibility'] ?? 0,
      clouds: json['clouds']['all'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cityName': cityName,
      'temperature': temperature,
      'feelsLike': feelsLike,
      'humidity': humidity,
      'windSpeed': windSpeed,
      'pressure': pressure,
      'visibility': visibility,
      'clouds': clouds,
      'description': description,
      'icon': icon,
    };
  }

  factory WeatherModel.fromStorage(String source) {
    final json = jsonDecode(source);
    return WeatherModel(
      cityName: json['cityName'],
      temperature: (json['temperature'] as num).toDouble(),
      feelsLike: (json['feelsLike'] as num).toDouble(),
      humidity: json['humidity'],
      windSpeed: (json['windSpeed'] as num).toDouble(),
      pressure: json['pressure'],
      visibility: json['visibility'],
      clouds: json['clouds'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}
