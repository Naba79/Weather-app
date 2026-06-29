import 'package:weather_app1/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:weather_app1/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:weather_app1/ui/views/home/home_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:weather_app1/ui/views/search/search_view.dart';
import 'package:weather_app1/ui/views/settings/settings_view.dart';
import 'package:weather_app1/services/weather_service.dart';
import 'package:weather_app1/services/shared_preferences_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(page: SearchView),
    MaterialRoute(page: SettingsView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: WeatherService),
    LazySingleton(classType: SharedPreferencesService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
