import 'package:test/test.dart';

void main() {
  group('GroupATest - ', () {
    test('ensure A1 functionality', () {
      expect(1 + 2, 3);
    });
    test('ensure A2 functionality', () {
      expect(2 + 2, 4);
    });
  }, skip: true);

  group('GroupBTest - ', () {
    test('ensure B1 functionality', () {
      expect(4 + 2, 6);
    });
  });
}
