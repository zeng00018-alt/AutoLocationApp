import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:devmob_autolocation/main.dart';

void main() {
  testWidgets('DEVMOBAutoLocationApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const DEVMOBAutoLocationApp());
    expect(find.text('DEVMOB-AutoLocation'), findsOneWidget);
  });
}