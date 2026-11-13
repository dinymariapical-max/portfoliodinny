import 'package:flutter_test/flutter_test.dart';

import 'package:portfoliodinny/main.dart';

void main() {
  testWidgets('Portfolio app displays the home page', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());
    await tester.pump();

    expect(find.text('About Me'), findsOneWidget);
  });
}
