import 'package:assignment_humancloud/calculator_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
 // Adjust this import according to your file structure

void main() {
  testWidgets('Calculator App - Addition and Subtraction', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: CalculatorApp()));

    // Helper function to simulate button presses
    Future<void> pressButton(String value) async {
      final buttonFinder = find.text(value);
      await tester.tap(buttonFinder);
      await tester.pump(); // Rebuild the widget after the state has changed
    }

    // Test addition
    await pressButton("2");
    await pressButton("+");
    await pressButton("3");
    await pressButton("=");

    // Verify that the output is "5"
    expect(find.text("5"), findsOneWidget);

    // Test subtraction
    await pressButton("5");
    await pressButton("-");
    await pressButton("2");
    await pressButton("=");

    // Verify that the output is "3"
    expect(find.text("3"), findsOneWidget);
  });

  testWidgets('Calculator App - Input Handling', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: CalculatorApp()));

    // Helper function to simulate button presses
    Future<void> pressButton(String value) async {
      final buttonFinder = find.text(value);
      await tester.tap(buttonFinder);
      await tester.pump(); // Rebuild the widget after the state has changed
    }

    // Input sequence for "7x8="
    await pressButton("7");
    await pressButton("x");
    await pressButton("8");
    await pressButton("=");

    // Verify that the output is "56"
    expect(find.text("56.0"), findsOneWidget);
  });

  testWidgets('Calculator App - Clear Input on Equals', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: CalculatorApp()));

    // Helper function to simulate button presses
    Future<void> pressButton(String value) async {
      final buttonFinder = find.text(value);
      await tester.tap(buttonFinder);
      await tester.pump(); // Rebuild the widget after the state has changed
    }

    // Input sequence for "9+1="
    await pressButton("9");
    await pressButton("+");
    await pressButton("1");
    await pressButton("=");

    // Verify that input is cleared and output is correct
    expect(find.text("10.0"), findsOneWidget);
  });
}