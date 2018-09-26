//create a class to create objects
class Person{}

//Lists
var strings = ["tree", "house", "cloud", "apple"];
var integers = [1, 2, 3, 4];
var doubles = [1.1, 2.2, 3.3, 4.4];
var booleans = [true, false, true, false];

//create person objects
var victor = new Person();
var steve = new Person();
var michael = new Person();
var dave = new Person();

var people = [victor, steve, michael, dave];

//empty list
var emptyList1 = new List<String>();
var emptyList2 = new List<int>();
var emptyList3 = new List<double>();
var emptyList4 = new List<Person>();

//maps are made up of key-value pairs

var someMap = {"firstName": "Victor",
                "lastName": "Wooding",
                "course": "Dart 2 in 7 Days",
                "audience": "beginners"};


void main() {

  print(someMap.length);
  print(someMap["course"]);
  print(someMap.keys);
  print(someMap.values);

}
