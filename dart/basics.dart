import 'dart:core'; //automatically imported
import 'dart:io'; //input output library

//main function
void main() {
  var firstName = "Arsalan";
  String lastName = "Malik";
  print("hello there" + " " + firstName + " " + lastName);

  //Input Output
  stdout.writeln("what is your real name?");
  String? name = stdin.readLineSync();
  print("your real name is $name");
}

/*
block comment.
*/


