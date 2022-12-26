import 'package:flutter_test/flutter_test.dart';

import 'stack.dart';

void main() {
  group('Test Add and Subtract!', () {
    test('Should add a number to total', () {
      final stack = Stack();
      stack.add(2); // 2
      stack.add(5); // 5
      expect(
        7,
        stack.total,
        reason: 'Testing Add: Does not match the result, '
            'Extected: 7, Found: ${stack.total}',
      );
    });

    test('Should subtract a number from total', () {
      final stack = Stack();
      stack.subtract(2); // -2
      stack.subtract(5); // -7
      expect(
        -7,
        stack.total,
        reason: 'Testing Subtract: Does not match the result, '
            'Extected: -7, Found: ${stack.total}',
      );
    });
  });

  group('Test Undo and Redo!', () {
    test('Should undo last step, and reflects the total', () {
      final stack = Stack();
      stack.add(2); // 2
      stack.add(2); // 4
      stack.subtract(2); // 2
      stack.subtract(2); // 0
      stack.add(2); // 2
      stack.add(2); // 4
      stack.undo(); // 2
      expect(
        2,
        stack.total,
        reason: 'Testing Undo: Does not match the result, '
            'Extected: 2, Found: ${stack.total}',
      );
    });

    test('Should redo last step, and reflects the total', () {
      final stack = Stack();
      stack.add(2); // 2
      stack.add(2); // 4
      stack.add(2); // 6
      stack.subtract(2); // 4
      stack.undo(); // 6
      stack.redo(); // 4
      expect(
        4,
        stack.total,
        reason: 'Testing Redo: Does not match the result, '
            'Extected: 4, Found: ${stack.total}',
      );
    });
  });

  group('Test bulk Undo and bulk Redo!', () {
    test('Should undo last specified steps', () {
      final stack = Stack();
      stack.add(1); // 1
      stack.subtract(1); // 0
      stack.add(1); // 1
      stack.add(1); // 2
      stack.add(1); // 3
      stack.subtract(1); // 2
      stack.subtract(1); // 1
      stack.add(1); // 2
      stack.add(1); // 3
      stack.subtract(1); // 2
      stack.undoLast(4); // ?
      expect(
        2,
        stack.total,
        reason: 'Testing bulk Undo: Does not match the result, '
            'Extected: 2, Found: ${stack.total}',
      );
    });

    test('Should redo last specified steps', () {
      final stack = Stack();
      stack.add(1); // 1
      stack.add(1); // 2
      stack.add(1); // 3
      stack.subtract(1); // 2
      stack.add(1); // 3
      stack.subtract(1); // 2
      stack.add(1); // 3
      stack.add(1); // 4
      stack.subtract(1); // 3
      stack.subtract(1); // 2
      stack.add(1); // 3
      stack.add(1); // 4
      stack.undoLast(4); // 4
      stack.redoLast(4); // 4
      expect(
        4,
        stack.total,
        reason: 'Testing bulk Redo: Does not match the result, '
            'Extected: 4, Found: ${stack.total}',
      );
    });
  });

  group('Test under and over steps!', () {
    test('Test no action Undo', () {
      final stack = Stack();
      stack.undo(); // 0
      stack.undo(); // 0
      stack.undo(); // 0
      expect(
        0,
        stack.total,
        reason: 'Testing no action Undo: Does not match the result, '
            'Extected: 0, Found: ${stack.total}',
      );
    });
    test('Test no action Redo', () {
      final stack = Stack();
      stack.add(2); // 2
      stack.add(5); // 7
      stack.redo(); // 7
      stack.redo(); // 7
      stack.redo(); // 7
      expect(
        7,
        stack.total,
        reason: 'Testing no action Redo: Does not match the result, '
            'Extected: 7, Found: ${stack.total}',
      );
    });

    test('Test over step Undo', () {
      final stack = Stack();
      stack.add(1); // 1
      stack.add(1); // 2
      stack.add(1); // 3
      stack.add(1); // 4
      stack.add(1); // 5
      stack.undoLast(20); // 0
      expect(
        0,
        stack.total,
        reason: 'Testing over step Undo: Does not match the result, '
            'Extected: 0, Found: ${stack.total}',
      );
    });

    test('Test over step Redo', () {
      final stack = Stack();
      stack.add(1); // 1
      stack.add(1); // 2
      stack.add(1); // 3
      stack.add(1); // 4
      stack.add(1); // 5
      stack.undoLast(2); // 3
      stack.redoLast(10); // 5
      expect(
        5,
        stack.total,
        reason: 'Testing over step Redo: Does not match the result, '
            'Extected: 5, Found: ${stack.total}',
      );
    });
  });
}
