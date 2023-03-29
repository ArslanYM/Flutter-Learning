void main() {
  var one = int.parse('1'); //convert string to int
  assert(one == 1); //assertion is true

  var two = double.parse('2.0');
  assert(two == 2.0);  //No error from assert functiion

  //String to int
  String oneAsString = 1.toString();
  assert(oneAsString == '1');

  String pi = 3.14159.toStringAsFixed(3);//gives upto 3 decimal places
  assert(pi == '3.142');

}
