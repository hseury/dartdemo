
abstract class IDartFeature {
  void runTest();
}

/**
 * 变量特性
 */
class VariableFeature extends IDartFeature {
  @override
  void runTest() {
    testList();
    testMap();
    testRunes();
  }

  void testRunes() {
    var clapping = '\u{1f44f}';
    print(clapping);
    print(clapping.codeUnits);
    print(clapping.runes.toList());

    Runes input = new Runes(
        '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
    print(new String.fromCharCodes(input));
  }

  void testMap() {
    var gifts = {'first': 'partridge'};
    assert(gifts['first'] == 'partridge');
    assert(gifts['fifth'] == null);
    gifts['fourth'] = 'calling birds';
    assert(gifts.length == 2);
  }

  void testList() {
    var list = [1, 2, 3];
    assert(list.length == 3);
    assert(list[1] == 2);

    list[1] = 1;
    assert(list[1] == 1);
  }
}

/**
 * 函数方法特性
 */
class FunctionFeature extends IDartFeature {
  var _nobleGases = [1, 2, null];

  @override
  void runTest() {
    assert(isNoble(1));
    assert(!isNoble(2));
    assert(isNobleV1(1));
    assert(!isNobleV1(2));
    assert(isNobleV2(1));
    assert(!isNobleV2(2));

    enableFlags(bold: true, hidden: false);
    enableFlags();
    assert("ABC" == say("A","B",'C'));
    assert("AB" == say("A","B"));
  }

  bool isNoble(int atomicNumber) {
    return _nobleGases[atomicNumber] != null;
  }

  /**
   * 选择忽略类型定义
   */
  isNobleV1(atomicNumber) {
    return _nobleGases[atomicNumber] != null;
  }

  /**
   * 对于只有一个表达式的方法，你可以选择 使用缩写语法来定义
   */
  bool isNobleV2(int atomicNumber) => _nobleGases[atomicNumber] != null;

  /**
   * 命名参数
   */
  void enableFlags({bool bold = false, bool hidden = false}) {
    print("bold = $bold , hidden = $hidden\n");
  }

  /**
   * 可选参数
   */
  String say(String from, String msg, [String device]) {
    var result = '$from$msg';
    if (device != null) {
      result = '$result$device';
    }
    return result;
  }
}
