

//A class is a blueprint for creating objects
//Class names must begin with a capital letter

class Computer{
  //classes can have properties
  String brand = "Apple";
  int gigsOfRAM = 8;
  double speedInGhz = 2.7;
  int storageSpace = 128;

  //method with no parameter or return type
  void sayGreeting(){
    print("Welcome to Dart 2 in 7 Days");
  }

  //method with one parameter but no return type
  void sayHelloTo(String yourname){
    print("Hello $yourname");
  }

  //method with one parameter to return an integer
  int multiplyByFour(int a){
    return a * 4;
  }

  //method with two parameters to return an integer
  int calculateSum(int a, int b){
    return a + b;
  }


}


class Phone{

  void sayGreeting(){
    print("Welcome to Dart 2 in 7 Days");
  }
}