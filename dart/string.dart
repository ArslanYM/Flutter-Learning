

void main(){ 

  var s1 = 'single quotes';
  var s2 = "double quotes";
  var s3 = 'It\'s easy';
  var s4 = "It's easy";

  print(s1);
  print(s2);
  print(s3);
  print(s4);


 //Raw string 
 var s = r'In a raw string, not even \n gets special treatment.';
  print(s);


  //string interpolation
  int age = 23;
  var s5 = 'my age is $age';
  print(s5);


  //multi line string
  var s6 = '''
  You can create
  multi-line strings like this one.
  ''';
  print(s6);

  var s7 = """
  This is also a
  multi-line string.
  """;
  print(s7);
  



}