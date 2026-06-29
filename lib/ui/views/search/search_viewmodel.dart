import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../services/shared_preferences_service.dart';
import '../../../services/weather_service.dart';

class SearchViewModel extends BaseViewModel {
  final _weatherService = locator<WeatherService>();
  final _prefsService = locator<SharedPreferencesService>();
  final _navigationService = locator<NavigationService>();

  final TextEditingController cityController = TextEditingController();

  Future<void> search() async {
  if (cityController.text.trim().isEmpty) return;

  setBusy(true);

  try {
    // Fetch weather data for the entered city
    final result = await _weatherService.getWeather(cityController.text.trim());
    await _prefsService.saveWeather(result);

    // Save the city name to shared preferences
    await _prefsService.saveCity(cityController.text.trim());

    //Back home screen with result
    _navigationService.back(result: true);
  } catch (e) {
    debugPrint(e.toString());
  }

  setBusy(false);
}
}