import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/resource/strings.dart';

void main() {
  testWidgets('portfolio renders its primary introduction', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      const ProviderScope(child: AppTheme()),
    );
    await tester.pump();

    expect(find.text(Strings.welcomeTxt), findsOneWidget);
    expect(find.text(Strings.name), findsOneWidget);
    expect(find.text(Strings.whatIdo), findsOneWidget);
    expect(find.text('View Selected Work'), findsOneWidget);
  });
}
