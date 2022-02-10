import 'package:test/test.dart';

/// 2 groups
/// show test output in VSCode
/// show flutter test on command line, just shows past tests
/// flutter test --help
/// flutter test -r expanded
/// add tag to group, tests
/// flutter test -r expanded -t 'tag1'
/// skip test, group

void main() {
  group('grp1', () {
    test('test1', () {
      expect(1, 1);
    }, tags: 'tag1');
    test('test2', () {
      expect(1, 1);
    });
  });
  group('grp2', () {
    test('test3', () {
      expect(1, 1);
    }, tags: 'tag1');
    test('test4', () {
      expect(1, 1);
    });
  });
}
