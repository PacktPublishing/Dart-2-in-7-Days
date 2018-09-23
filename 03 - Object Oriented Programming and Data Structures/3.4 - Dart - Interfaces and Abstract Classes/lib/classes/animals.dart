
abstract class Animal{
  bool vertebrate;
  void eat();
}

class AirAnimal{
  void livesInAir(){
    print("This animal lives in the air");
  }
}

class Mammal{
  bool coveredInFur;
  bool hasHair;


  Mammal(this.coveredInFur, this.hasHair);

  void breastfeed(){
    print("This animal breastfeeds!");
  }
}

//Try to inherit from two classes

class Bat implements Mammal, AirAnimal, Animal{
  @override
  bool coveredInFur;

  @override
  bool hasHair;

  @override
  void breastfeed() {
    // TODO: implement breastfeed
  }

  @override
  void livesInAir() {
    // TODO: implement livesInAir
  }

  @override
  bool vertebrate;

  @override
  void eat() {
    // TODO: implement eat
  }


}








