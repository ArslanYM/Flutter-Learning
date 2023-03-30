void main() {
//list
//just an array
 //list is mutable 
  var list = [1, 2, 3, 4, 5, 6, 7]; //list of int
  print(list[0]); //first
  print(list[6]); //last
  print(list.length); //length
  
 



  //statically typed list
  List<String> list2 = const  ['a', 'b', 'c', 'd', 'e', 'f', 'g']; //list of string
  //using const keyword we can make list immutable
  for(var n in list2 ){
    print(n);
  }  //first



// dyanmic list 
  var list3 = [1, 'a', true, 1.1]; //list of dynamic  
  for(var n in list3 ){
    print(n);
  }  //first


 // Spread operator
 //copying list
 var list4 = [...list]; //list of dynamic  
  for(var n in list4 ){
    print(n);
  }  //first
}
