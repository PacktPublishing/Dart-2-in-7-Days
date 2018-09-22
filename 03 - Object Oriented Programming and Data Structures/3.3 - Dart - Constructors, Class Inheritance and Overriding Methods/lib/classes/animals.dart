
class Animal{
  String name;
  int numberOfLegs;
  bool canFly;

  Animal(this.name, this.numberOfLegs, this.canFly);

  //add a method
  void eat(){
    print("this animal eats food");
  }


}

class Mammal extends Animal{
  Mammal(String name, int numberOfLegs, bool canFly) : super(name, numberOfLegs, canFly);

  @override
  void eat() {
    // TODO: implement eat
    //super.eat();
    print("Dogs eat meat");
  }

}











