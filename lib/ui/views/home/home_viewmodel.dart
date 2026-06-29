import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../models/weather_model.dart';
import '../../../services/shared_preferences_service.dart';
import '../../../services/weather_service.dart';

class HomeViewModel extends BaseViewModel {
  final _weatherService = locator<WeatherService>();
  final _prefsService = locator<SharedPreferencesService>();
  final _navigationService = locator<NavigationService>();

  WeatherModel? weather;

  Future<void> initialise() async {
    final savedWeather = await _prefsService.getSavedWeather();
    if (savedWeather != null) {
      weather = savedWeather;
      notifyListeners();
      return;
    }

    final city = await _prefsService.getLastCity();
    if (city != null) {
      await getWeather(city);
    }
  }

  Future<void> getWeather(String city) async {
    setBusy(true);
    try {
      weather = await _weatherService.getWeather(city);
      await _prefsService.saveWeather(weather!);
    } catch (e) {
      weather = null;
    }

    setBusy(false);
    notifyListeners();
  }

  Future<void> goToSearch() async {
    final result = await _navigationService.navigateToSearchView();
    if (result == true) {
      await initialise();
    }
  }

  void goToSettings() {
    _navigationService.navigateToSettingsView();
  }
}