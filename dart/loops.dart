//Same as JavaScript 
void main() {
  var i = 0;
  while (i < 5) {
    print(i);
    i++;
  }
  print("Done");

  // for loop
  for (var i = 0; i < 5; i++) {
    print(i);
  }
  print("Done");


  //for in loop 

  var numbers = [1, 2, 3];
  for (var n in numbers) {
    print(n);
  }
   
  print("Done");

  //for each loop
  numbers.forEach((n) => print(n));
  print("Done");

}