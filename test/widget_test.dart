import 'package:flutter_test/flutter_test.dart';
import 'package:chess_concept/main.dart';

void main() {
  testWidgets('App renders home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const ChessApp());
    expect(find.text('Be the\nKing of\nChess'), findsOneWidget);
  });
}
