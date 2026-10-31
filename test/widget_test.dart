import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:autolocationapp/main.dart';

void main() {
  testWidgets('AutoLocationApp smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const AutoLocationApp());
    
    expect(find.text('AutoLocation'), findsOneWidget);
  });
}