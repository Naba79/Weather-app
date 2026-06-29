import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/weather_model.dart';

class SharedPreferencesService {
  Future<void> saveCity(String city) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastCity', city);
  }

  Future<String?> getLastCity() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('lastCity');
  }

  Future<void> saveWeather(WeatherModel weather) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastWeather', jsonEncode(weather.toJson()));
  }

  Future<WeatherModel?> getSavedWeather() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('lastWeather');
    if (data == null) return null;
    return WeatherModel.fromStorage(data);
  }

  Future<void> saveTheme(bool dark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', dark);
  }

  Future<bool> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('darkMode') ?? false;
  }
}
