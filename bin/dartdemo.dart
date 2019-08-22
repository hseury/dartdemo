import 'Animal.dart';
import 'Bird.dart';

void testVariables(){
  Animal animal = new Animal();
  assert("animal's name" == animal.getName());
  assert("animal's nick name" == animal.nickName);

  Animal bird = new Bird();
  assert("bird" == bird.getName());

}

void main() {
  testVariables();
}
