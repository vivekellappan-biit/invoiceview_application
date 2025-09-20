// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:invoiceview_application/main.dart';

void main() {
  testWidgets('Invoice app loads correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const InvoiceApp());

    // Wait for the BLoC to load data
    await tester.pumpAndSettle();

    // Verify that the app title is displayed.
    expect(find.text('GreatCollections®'), findsOneWidget);
    expect(find.text('Jack Fitch'), findsOneWidget);
    expect(find.text('Unpaid Invoices'), findsOneWidget);
    expect(find.text('Paid Invoices'), findsOneWidget);
  });
}
