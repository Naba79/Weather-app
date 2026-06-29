import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});
  @override
  Widget builder(BuildContext context, HomeViewModel vm, Widget? child) {
    final w = vm.weather;
    return Scaffold(
      appBar: AppBar(title: const Text('Weather'), actions: [
        IconButton(onPressed: vm.goToSettings, icon: const Icon(Icons.settings))
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: vm.goToSearch, child: const Icon(Icons.search)),
      body: vm.isBusy
          ? const Center(child: CircularProgressIndicator())
          : w == null
              ? const Center(child: Text('Search for a city'))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(children: [
                    Card(
                        child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(children: [
                              Image.network(
                                  'https://openweathermap.org/img/wn/${w.icon}@4x.png',
                                  width: 100),
                              Text(w.cityName,
                                  style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold)),
                              Text('${w.temperature.round()}°C',
                                  style: const TextStyle(fontSize: 45)),
                              Text(w.description)
                            ]))),
                    const SizedBox(height: 15),
                    GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 1.8,
                        children: [
                          _card(Icons.water_drop, 'Humidity', '${w.humidity}%'),
                          _card(Icons.air, 'Wind', '${w.windSpeed} m/s'),
                          _card(
                              Icons.compress, 'Pressure', '${w.pressure} hPa'),
                          _card(
                              Icons.visibility,
                              'Visibility',
                              w.visibility >= 10000
                                  ? '10+ km'
                                  : '${(w.visibility / 1000).toStringAsFixed(1)} km'),
                          _card(Icons.cloud, 'Clouds', '${w.clouds}%'),
                          _card(Icons.thermostat, 'Feels like',
                              '${w.feelsLike.round()}°C'),
                        ])
                  ])),
    );
  }

  Widget _card(IconData icon, String title, String value) => Card(
      child: ListTile(
          leading: Icon(icon), title: Text(title), subtitle: Text(value)));

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
  @override
  void onViewModelReady(HomeViewModel vm) => vm.initialise();
  @override
  bool get reactive => true;
}
