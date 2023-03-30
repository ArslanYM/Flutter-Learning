class Num {
  int num = 10;
}

void main() {
  var n;
  var number;
  //? checks if n is null or not
  number = n?.num ?? 0; // ?? will set 0 if n is null temporarily

  print(number);

  var x;
  print(x ??= 100); // ??= will set 100 if x is null
  print(x); // 100
}
