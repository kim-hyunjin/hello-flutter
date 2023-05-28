// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meals_app/data/dummy_meals.dart';
import 'package:meals_app/models/meal.dart';

import 'package:meals_app/screens/meals_screen.dart';

void main() {
  void _onToggleFav(Meal meal) {}
  testWidgets('meals screen - empty meals', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
          home: MealsScreen(
        title: 'test',
        meals: [],
        onToggleFavorite: _onToggleFav,
      )),
    );

    expect(find.text('test'), findsOneWidget);
    expect(find.byType(ListView), findsNothing);
    expect(find.text('Try selecting different category'), findsOneWidget);
  });

  testWidgets('meals screen - with meals', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
          home: MealsScreen(
        title: 'test',
        meals: dummyMeals,
        onToggleFavorite: _onToggleFav,
      )),
    );

    expect(find.text('test'), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
    expect(find.text('Try selecting different category'), findsNothing);
  });
}
