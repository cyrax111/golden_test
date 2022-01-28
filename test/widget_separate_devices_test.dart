import 'package:flutter_test/flutter_test.dart';

import 'package:golden/main.dart';
import 'package:golden/test_device_goldens.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  testDeviceGoldens(
    'Separate devices',
    (tester, device) async {
      await tester.pumpWidget(const MyApp());

      await tester.pump();
      await tester.pump();
      await tester.pump();

      await expectLater(find.byType(MyApp),
          matchesGoldenFile('separate/main.${device.name}.png'));
    },
    devices: [Device.iphone11, Device.phone, Device.tabletLandscape],
  );
}
