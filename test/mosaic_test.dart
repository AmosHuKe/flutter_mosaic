import 'package:flutter/material.dart';

import 'package:flutter_mosaic/flutter_mosaic.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mosaic_widget.dart';

void main() {
  const Size mosaicSize = Size(40, 40);
  const Key mosaicWidgetKey = Key('MosaicWidget');

  testWidgets('Mosaic enabled true', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MosaicTestWidget(
        enabled: true,
        mosaicSize: mosaicSize,
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));

    /// flutter test --update-goldens
    await expectLater(
      find.byKey(mosaicWidgetKey),
      matchesGoldenFile('goldens/mosaic_enabled_true.png'),
    );
  });

  testWidgets('Mosaic enabled false', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MosaicTestWidget(
        enabled: false,
        mosaicSize: mosaicSize,
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));

    /// flutter test --update-goldens
    await expectLater(
      find.byKey(mosaicWidgetKey),
      matchesGoldenFile('goldens/mosaic_enabled_false.png'),
    );
  });

  testWidgets('Mosaic mosaicSize Size(0, 0)', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MosaicTestWidget(
        mosaicSize: Size(0, 0),
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));

    /// flutter test --update-goldens
    await expectLater(
      find.byKey(mosaicWidgetKey),
      matchesGoldenFile('goldens/mosaic_mosaicSize_Size_0_0.png'),
    );
  });

  testWidgets('Mosaic SampleCount.s1', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MosaicTestWidget(
        sampleCount: SampleCount.s1,
        mosaicSize: mosaicSize,
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));

    /// flutter test --update-goldens
    await expectLater(
      find.byKey(mosaicWidgetKey),
      matchesGoldenFile('goldens/mosaic_sampleCount.s1.png'),
    );
  });

  testWidgets('Mosaic SampleCount.s2', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MosaicTestWidget(
        sampleCount: SampleCount.s2,
        mosaicSize: mosaicSize,
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));

    /// flutter test --update-goldens
    expectLater(
      find.byKey(mosaicWidgetKey),
      matchesGoldenFile('goldens/mosaic_sampleCount.s2.png'),
    );
  });

  testWidgets('Mosaic SampleCount.s4', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MosaicTestWidget(
        sampleCount: SampleCount.s4,
        mosaicSize: mosaicSize,
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));

    /// flutter test --update-goldens
    expectLater(
      find.byKey(mosaicWidgetKey),
      matchesGoldenFile('goldens/mosaic_sampleCount.s4.png'),
    );
  });

  testWidgets('Mosaic SampleCount.s8', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MosaicTestWidget(
        sampleCount: SampleCount.s8,
        mosaicSize: mosaicSize,
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));

    /// flutter test --update-goldens
    expectLater(
      find.byKey(mosaicWidgetKey),
      matchesGoldenFile('goldens/mosaic_sampleCount.s8.png'),
    );
  });
}
