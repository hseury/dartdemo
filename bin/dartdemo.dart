import 'Animal.dart';
import 'Bird.dart';
import 'IDartFeature.dart';

void testVariables(){
  Animal animal = new Bird();
  assert("animal's nick name" == animal.nickName);

  Animal bird = new Bird();
  assert("bird" == bird.getName());

}

void main() {
  testVariables();

  new VariableFeature().runTest();
  new FunctionFeature().runTest();
}


