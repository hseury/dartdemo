
import 'Bird.dart';
import 'Todo.dart';

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

    anonymousFunc();
    testClosure();
    assert(null == testReturnValue());
    testloops();
    testConstruction();
    testAsynchrony();
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

  /**
   * 匿名方法
   */
  void anonymousFunc() {
    var list = ['apples', 'oranges', 'grapes', 'bananas', 'plums'];
    list.forEach((i) {
      print(list.indexOf(i).toString() + ': ' + i);
    });
  }

  /**
   * 闭包
   */
  void testClosure() {
    // Create a function that adds 2.
    var add2 = makeAdder(2);
    print("add2 = " + add2.toString());
    var num = add2(3);
    print("num = " + num.toString());
    // Create a function that adds 4.
    var add4 = makeAdder(4);

    assert(add2(3) == 5);
    assert(add4(3) == 7);
  }

  Function makeAdder(num addBy) {
    return (num i) => addBy + i;
  }

  testReturnValue(){
    Bird bird = new Bird();
    assert(100 == bird.id);
    bird..id=101..sing();
    assert(101 == bird.id);
  }

  testloops(){
    var callbacks = [];
    for (var i = 0; i < 2; i++) {
      callbacks.add(() => print(i));
    }
    callbacks.forEach((c) => c());
  }

  testConstruction(){
    var emp = new Employee.fromJson({});
    if (emp is Person) {
      // Type check
      emp.firstName = 'Bob';
    }
    (emp as Person).firstName = 'Bob';
  }

  testAsynchrony() async {
    var version = await lookUpVersion();
    if (version =="1.0.1") {
      // Do something.
      print("lookUpVersion = " + version);
    } else {
      // Do something else.
    }

    printNumAsync("R1");
    printNumAsync("R2");
  }

  printNumSync() {
    for(int i = 0;i< 100;i++){
      print("sync " + i.toString());
    }
  }

  @todo("hseury", "test metadata")
  printNumAsync(var tag)  async {
     for(int i = 0;i< 100;i++){
       await print(tag + " sync " + i.toString());
    }
  }

  String lookUpVersionSync() => '1.0.0';

  /*Future<String>*/ lookUpVersion() async => '1.0.1';
}

class Person {
  String firstName;

  Person.fromJson(Map data) {
    print('in Person');
  }

  Person(){
    print('default Person constructor');
  }
}

class Employee extends Person {
  // Person does not have a default constructor;
  // you must call super.fromJson(data).
  Employee.fromJson(Map data) {
    print('in Employee');
  }
}


