import 'package:introduction_to_classes_and_objects/classes/computers.dart';
import 'package:introduction_to_classes_and_objects/classes/animals.dart';

void main() {

  //Computer Objects
  /*
  /*
  print(myComputer.brand);
  print(myComputer.gigsOfRAM);
  print(myComputer.speedInGhz);
  print(myComputer.storageSpace);

  //We can get the type of object by using dot runtimeType function
  print(myComputer.runtimeType);
  print(myPhone.runtimeType);
*/

   var myComputer = new Computer();
  var myPhone = new Phone();
  myComputer.sayGreeting();

  myComputer.sayHelloTo("Victor");

  var result1 = myComputer.multiplyByFour(4);
  print(result1);

  var result2 = myComputer.calculateSum(4, 3);
  print(result2);

  myPhone.sayGreeting();
*/

  var someAnimal = new Animal("Elephant", 4, false);

  print(someAnimal.name);
  print(someAnimal.numberOfLegs);
  print(someAnimal.canFly);

  //var someComputer = new Computer();

  var someMammal = new Mammal("Dog", 4, false);

  print(someMammal.name);
  print(someMammal.numberOfLegs);
  print(someMammal.canFly);

  someAnimal.eat();
  someMammal.eat();

}
