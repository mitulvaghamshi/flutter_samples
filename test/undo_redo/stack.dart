class Stack {
  Stack()
      : _total = 0,
        _undoList = [],
        _redoList = [];

  int _total;
  final List<int> _undoList;
  final List<int> _redoList;

  int get total => _total;

  void add(int value) {
    _total += value;
    _undoList.add(value);
  }

  void subtract(int value) {
    _total -= value;
    _undoList.add(-value);
  }

  void undo() {
    if (_undoList.isNotEmpty) {
      int value = _undoList.removeLast();
      _total -= value;
      _redoList.add(value);
    }
  }

  void redo() {
    if (_redoList.isNotEmpty) {
      add(_redoList.removeLast());
    }
  }

  void undoLast(int steps) {
    while (steps-- > 0) {
      undo();
    }
  }

  void redoLast(int steps) {
    while (steps-- > 0) {
      redo();
    }
  }
}
