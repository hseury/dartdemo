import 'Animal.dart';
import 'Bird.dart';
import 'IDartFeature.dart';

void testVariables(){
  Animal animal = new Bird();
  assert("animal's nick name" == animal.nickName);

  Animal bird = new Bird();
  assert("bird" == bird.getName());

}

Function makeAdder(num addBy) {
  return (num i) => addBy + i;
}

void main() {
  testVariables();
  testClosure();

  new VariableFeature().runTest();
  new FunctionFeature().runTest();
}

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
