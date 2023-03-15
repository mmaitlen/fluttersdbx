import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // time test below...but what about memory??

  testWidgets('test', (WidgetTester tester) async {
    await tester.pumpWidget(Container());
    final Stopwatch timer = Stopwatch()..start();
    for (int index = 0; index < 100; index++) {
      await tester.pump();
    }
    timer.stop();
    debugPrint('Time taken: ${timer.elapsedMilliseconds}ms');
  });
}
