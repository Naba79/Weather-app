import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/weather_model.dart';

class WeatherService {
  final String _apiKey = dotenv.env['WEATHER_API_KEY'] ?? '';

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