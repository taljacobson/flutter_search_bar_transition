import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:RevealSearchBar/RevealSearchBar.dart';

void main() {
  testWidgets('smoke test', (WidgetTester tester) async {
    final controller = TextEditingController(text: '0');
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: RevealAppBar(searchController: controller),
        ),
      ),
    );
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.text('0'), findsNothing);

    // Tap the icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle();

    expect(find.text('0'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'text');

    expect(find.text('text'), findsOneWidget);

    expect(controller.value.text, 'text');
  });

  testWidgets('open and close', (WidgetTester tester) async {
    final controller = TextEditingController(text: '0');
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: RevealAppBar(searchController: controller),
        ),
      ),
    );
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.text('0'), findsNothing);

    // Tap the icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle();

    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    expect(find.text('0'), findsNothing);
  });

  testWidgets('open and clear', (WidgetTester tester) async {
    final controller = TextEditingController(text: '0');
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: RevealAppBar(searchController: controller),
        ),
      ),
    );
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.text('0'), findsNothing);

    // Tap the icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle();

    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.close));
    await tester.pumpAndSettle();

    expect(find.text('Search'), findsOneWidget);
  });

  testWidgets('searchIconContainer', (WidgetTester tester) async {
    final controller = TextEditingController(text: '0');
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: RevealAppBar(
            searchController: controller,
            searchIconContainer: Icon(Icons.cloud_upload),
          ),
        ),
      ),
    );
    expect(find.byIcon(Icons.cloud_upload), findsOneWidget);
    expect(find.text('0'), findsNothing);
  });
}
