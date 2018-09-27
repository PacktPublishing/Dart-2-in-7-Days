
var list1 = ["eggs", "bread", "milk", "cheese", "sugar"];

var someMap = {1: "one",
                2: "two",
                3: "three",
                4: "four"};

//Create an empty array
var list2 = [];
var list3 = [];

main() {

//  print(list1[0]);
//  print(list1[1]);
//  print(list1[2]);
//  print(list1[3]);
//  print(list1[4]);

//print all the items in the list
  for(var i = 0; i < list1.length; i++){
    print(list1[i]);
  }
//convert all items to uppercase
  for(var i = 0; i < list1.length; i++){
    print(list1[i].toUpperCase());
  }

  //add items from list1 to list2
  for(var i = 0; i < list1.length; i++){
   list2.add(list1[i]);
  }

  list2.shuffle();
  print(list2);

  someMap.forEach((k, v)=> print(k));
  someMap.forEach((k, v)=> print(v));

  someMap.forEach((k, v){
    list3.add(k);
  });

  print(list3);
}
