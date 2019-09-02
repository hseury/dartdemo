import 'Animal.dart';

class Bird extends Animal {
  int id = 100;

  @override
  String getName() {
    // TODO: implement getName
    return "bird";
  }

  void sing(){
    print("bird sing");
  }
}
