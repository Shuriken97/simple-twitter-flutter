// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:integration_test/integration_test.dart';

import 'package:simple_twitter/main.dart' as app;

import 'robot/login_view_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  Get.testMode = true;

  group('Authentication Flow', () {
    testWidgets('Login User', (WidgetTester tester) async {
      app.main();

      final LoginViewRobot loginViewRobot = LoginViewRobot(tester);

      await tester.pumpAndSettle(const Duration(seconds: 10));

      await loginViewRobot.enterLoginCredentials();
    });
  });
}
