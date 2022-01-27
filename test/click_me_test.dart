import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sdbx/detail_screen.dart';

void main() {
  testWidgets("Flutter Widget Test", (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ClickMeWidget()));

    expect(tester.widget<Text>(find.byKey(const Key('textvalue'))).data, '123');

    await tester.tap(find.byKey(const Key('clickbtn')));

    await tester.pumpAndSettle();

    expect(tester.widget<Text>(find.byKey(const Key('textvalue'))).data, '124');
  });
}
