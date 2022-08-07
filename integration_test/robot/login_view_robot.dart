import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_twitter/components/simple_form_field.dart';

class LoginViewRobot {
  const LoginViewRobot(this.tester);

  final WidgetTester tester;

  Future<void> enterLoginCredentials() async {
    await tester.pumpAndSettle();
    final Finder textfieldEmail = find.byType(SimpleTextField).first;
    await tester.tap(textfieldEmail);

    await tester.enterText(textfieldEmail, 'hello@admin.com');

    final Finder textfieldPassword = find.byType(SimpleTextField).last;
    await tester.tap(textfieldPassword);

    await tester.enterText(textfieldEmail, 'Admin123');

    final Finder loginviewButton = find.widgetWithText(ElevatedButton, 'Login');
    await tester.tap(loginviewButton, warnIfMissed: false);

    await tester.pumpAndSettle(const Duration(seconds: 5));
    expect(find.text('Home'), findsOneWidget, reason: 'To show login successfully and navigated to home view');
  }
}
