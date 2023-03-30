void main(List<String> args) {
  //set
  //set is a collection of unique items
  //set is unordered
  //set is not index based
  //set is not  duplicate
  //set is not  null
  //set is not  mutable

  var numbers = {1, 2, 3, 3};
  for (var n in numbers) {
    print(n); //doest print 3 twice
  }

  Set<String> names = {};
  names.add('a');
  names.add('a');
  for(var n in names) {
    print(n); //doest print a twice
  }
}
