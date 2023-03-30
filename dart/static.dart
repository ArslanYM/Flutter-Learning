class Person {
  String name;
  static int age = 10;//static variable or class variable

  Person(this.name);
}



void main() {

  Person person1 = Person('Rahul');
  print(person1.name);
  print(Person.age);//static variable can be accessed by class name

  Person person2 = Person('malik');
  print(person2.name);
  print(Person.age);

  Person.age = 20;//static variable can be changed by class name
  print(Person.age);

  Person person3 = Person('yeet');
  print(person3.name);
  print(Person.age);

  Person person4 = Person('karan');
  print(person4.name);
  print(Person.age);
}