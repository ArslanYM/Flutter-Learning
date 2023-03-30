//Positional arguments
//named arguments

void main() {
  print(sum(4, num2: 2));

}

int sum (var num1,  {var num2}) {
  return num1 + (num2 ?? 0);
}