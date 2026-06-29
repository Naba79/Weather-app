import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app1/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('WeatherServiceServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
