import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:animal_atlas/main.dart';

void main() {
  testWidgets('opens directly on login', (WidgetTester tester) async {
    await tester.pumpWidget(const PokemonAtlasApp());

    expect(find.text('Pokemon Atlas'), findsOneWidget);
    expect(find.text('Login'), findsNWidgets(2));
  });
}
