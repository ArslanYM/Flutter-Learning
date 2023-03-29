void main() {
  //int
  //double
  //String
  //bool
  //dynamic
  print("    Int / double  ");
  int a1 = 100;
  int a2 = 100;
  int suma1a2 = a1 + a2;
  print("a1 + a2 =  $suma1a2 ");
  double a3 = 100.2;
  double a4 = 100.2;
  double suma3a4 = a3 + a4;
  print("a3 + a4 =  $suma3a4 ");




  print("   bool   ");
  bool isItTrue1 = true;
  var isItTrue2 = false;
  print(" isItTrue2 : $isItTrue2");
  
  if (isItTrue1) {
    isItTrue2 = true;
  }
  print("after checking isItTrue1 , isIttrue2 becomes :  $isItTrue2");



  print("  dynamic    ");
  dynamic weakVariable = 100;
  print("weak variable initially = $weakVariable");
  weakVariable = "i changed its value from integer to string";
  print("weak variable now = $weakVariable");
  


}
