//Class

class Person {
  String name;
  int age;
  //method
  Person(this.name , [this.age=18]);//[this.age] is optional and 18 is default value

  //named constructor
  

}

void main(List<String> args) {

  //object
  Person person1 =  Person('Rahul');
  print(person1.name);
  print(person1.age);


  Person person2 =  Person('malik', 20);
  print(person2.name);
  print(person2.age);






}
