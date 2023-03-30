//Map
// works like a dictionary 
// key value pair
// key is unique
//unordered


void main() {
   var gift=  {


      //key: value
      'first': 'partridge',
      'second': 'turtledoves',
      'fifth': 'golden rings'
    };


    print(gift['first']);
    //prints partridge


    //creating an empty map 
    var gifts2 = Map();
    print(gifts2.runtimeType);
    // _Map<dynamic, dynamic>

    //adding values to the map
    gifts2['first'] = 'partridge';
    gifts2['second'] = 'turtledoves';
    gifts2['fifth'] = 'golden rings';
    print(gifts2);

   
   
   }
