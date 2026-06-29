import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WeatherService {
  static const String _apiKey = '701f199c00195624805a8e6b43d6a7ff';

  Future<WeatherModel> getWeather(String city) async {
  final url = Uri.parse(
    'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$_apiKey&units=metric',
  );

  final response = await http.get(url);

  print(response.statusCode);
  print(response.body);

  if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
}