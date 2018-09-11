

void main() {
  //Creating Variables
 /*
 //print("hello world");

 var firstName = "Victor";
 var age = 33;

 //firstName = 33;
 //age = "Victor";

 firstName = "Steve";
 age = 26;

 String lastName = 'Wooding';
 int currentAge = 33;

 double height = 181.61;
 num milesToBridgetown = 17;

 bool isSunny = true;
 bool isHungry = false;

 print(firstName);
 print(age);
 print(lastName);
 print(currentAge);
 print(height);
 print(milesToBridgetown);
 print(isSunny);
 print(isHungry);

*/

  //String Concatenation
/*
 String name = "Victor";
 String greeting = "Hello";

 String fullGreeting = greeting + " " + name;
 print(fullGreeting);

 //String Interpolation

 name = "Steve";
 var groceries = "milk, cheese, eggs, ham and bread";
 name = "Michael";
  var someString = "Today $name is going to the store to buy $groceries!";

  print(someString);

  print(name.toUpperCase());
  print(name);

  print(name.toLowerCase());
  print(name);
*/

  //Operators
/*
  var a = 2;
  var b = 3;

  //additive (+ -)
  print(a+b);

  a = a + 2;
  print(a);
  print(a-b);


  var c = 4;
  var d = 5;

  //multiplicative (* /)
  print("The product of $c and $d is ${c * d}");
  print("$c divided by $d is ${c / d}");
  print("The remainder when $d is divided by $c is ${d % c}");

  //equality (== !=)
  print(c == d);
  print(c != d);

  //relational (<=  <  >  >=)
  print (4 > 5);
  print (4 < 5);
  */

  //If Else and Logical Operators
/*
//if(condition){
//      code to be executed
//    }


  int favouriteNumber = 9;

  if (false){
    print("this always prints because this is true");
  }

  var x = 7;
  var y = 20;

  if (x > y){
    print("$x is more than $y");
  }else {
    print("$x is less than $y");
  }

  //it is possible to perform multiple checks using else if

  if(x == 5){
    print("$x is 5");
  }else if (x == 6){
    print("$x is 6");
  }else if (x == 10){
    print("$x is 10");
  }else {                 //there is no condition for else
    print("$x is not 5, 6 or 10");
  }


  //Logical Operators (double ampersand &&; double pipe ||; not !)

  int answer;
  //answer = 10;


//  if ((answer % 2 == 0 ) && (answer < 10 )){
//    print("You are correct");
//  }else{
//    print("You are incorrect");
//  }
  answer = 4;
  if ((answer % 3 == 0) || (answer % 6 != 0)){
    print("You are correct");

  }else{
    print("You are wrong");
  }
*/

  //For Loops, While, Do-While and Break
/*
  //for loops
  for(var i = 0; i < 5; i++){
    print("Dart is cool ${i}");
  }

  for(int i = 1; i <= 7; i++){
    print("Dart 2 in $i days");
  }

  //while loops
  var a = 1;
  while(a < 10){
    print("This is an infinite loop");
    break;
  }

  //if we type break we can exit the loop

  //do while loops
  do {
    print("I am going to be an excellent mobile app developer!");
    //break;
  }while(false);

  //the two times table
  for(int b = 0; b < 1000; b++){
    print("2 x $b = ${b * 2}");
  }
*/

  //Switch Statements

 String description = "storm";
 String advice;

 switch(description){
   case "sunny":
     advice = "walk with sunglasses";
   print(advice);
   break;

   case "rainy":
     advice = "walk with an umbrella";
     print(advice);
     break;

   case "windy":
     advice = "walk with a scarf";
     print(advice);
     break;

   case "snowing":
     advice = "You'll need a winter jacket, gloves, boots, scarf and a hat";
     print(advice);
     break;

   case "hot":
     advice = "break out the shorts!";
     print(advice);
     break;

   default:
     print("weather data unavailable");
 }

 var position = 3;
 switch(position){
   case 1: print("You came first");
   break;

   case 2: print("You came second");
   break;

   case 3: print("You came third");
    break;

   default: print("you didn't place");
 }



















}
