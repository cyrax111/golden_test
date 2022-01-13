import 'package:flutter_test/flutter_test.dart';

import 'package:golden/main.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// flutter test --update-goldens
void main() {
  testGoldens('Counter golden test', (WidgetTester tester) async {
    await loadAppFonts();

    await tester.pumpWidgetBuilder(const MyHomePage(title: 'Title'));

    await multiScreenGolden(
      tester,
      'my_home_page',
      devices: [Device.phone, Device.iphone11, Device.tabletLandscape],
      customPump: (tester) async {
        await tester.pump();
      },
      deviceSetup: (device, tester) async {},
    );

    await tester.pump(const Duration(hours: 1));
  });
}
