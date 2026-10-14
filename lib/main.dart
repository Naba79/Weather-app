import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app1/app/app.bottomsheets.dart';
import 'package:weather_app1/app/app.dialogs.dart';
import 'package:weather_app1/app/app.locator.dart';
import 'package:weather_app1/app/app.router.dart';
import 'package:weather_app1/services/shared_preferences_service.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await dotenv.load(fileName: ".env");

  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  final dark = await locator<SharedPreferencesService>().getTheme();
  runApp(MainApp(dark: dark));
}

class MainApp extends StatefulWidget {
  final bool dark;
  const MainApp({super.key, required this.dark});

  static MainAppState? of(BuildContext context) => context.findAncestorStateOfType<MainAppState>();
  @override
  State<MainApp> createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  late bool darkMode = widget.dark;

  void changeTheme(bool value) async {
    darkMode = value;
    await locator<SharedPreferencesService>().saveTheme(value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      darkTheme: ThemeData(useMaterial3: true, brightness: Brightness.dark, colorSchemeSeed: Colors.blue),
      initialRoute: Routes.homeView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [StackedService.routeObserver],
    );
  }
}