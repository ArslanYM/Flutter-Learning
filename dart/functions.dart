
//Functions 
//same as JS functions



void main() {
  int a = 10;
  int b = 20;

  print(add(a, b));//prints 30


  //arrow function

  var add2 = (int a, int b) => a + b;
  print(add2(a, b));//prints 30


  //anonymous function
  var result = (int a, int b) => a + b;
  print(result(a, b));//prints 

}



int add(int a, int b) {
  return a + b;
}