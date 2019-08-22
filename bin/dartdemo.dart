import 'Animal.dart';

void testVariables(){
  Animal animal = new Animal();
  assert("animal's name" == animal.getName());
  assert("animal's nick name" == animal.nickName);

}

void main() {
  testVariables();
}
