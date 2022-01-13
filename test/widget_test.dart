// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:golden/main.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens('Counter golden test', (WidgetTester tester) async {
    await loadAppFonts();

    // final builder = DeviceBuilder()
    //   ..overrideDevicesForAllScenarios(devices: [Device.phone, Device.iphone11])
    //   ..addScenario(
    //     name: 'email screen',
    //     widget: const MyHomePage(title: 'Title'),
    //   );
    await tester.pumpWidgetBuilder(const MyHomePage(title: 'Title'));
    // await tester.pumpWidget(const MyApp());

    // await expectLater(
    //     find.byType(MyApp), matchesGoldenFile('my_home_page.png'));

    // await tester.pumpAndSettle();

    // await expectLater(
    //     find.byType(MyApp), matchesGoldenFile('my_home_page_2.png'));

    // await tester.runAsync(() async {});
    // await Future.delayed(Duration(seconds: 1));

    await tester.pump();
    // await tester.pump(const Duration(milliseconds: 50));
    // await tester.pump(const Duration(milliseconds: 100));
    // await tester.pumpDeviceBuilder(builder);
    // await screenMatchesGolden(tester, 'my_home_page');
    await multiScreenGolden(
      tester,
      'my_home_page',
      devices: [Device.phone, Device.iphone11, Device.tabletLandscape],
      customPump: (tester) async {
        // await tester.pump();
        // await tester.pump(const Duration(milliseconds: 50));
      },
      deviceSetup: (device, tester) async {
        // await tester.pump(const Duration(milliseconds: 50));
      },
    );

    await tester.pump(const Duration(hours: 1));
  });
}
