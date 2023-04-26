import 'package:coffeeui_app/utils/coffee_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/coffee_types.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List coffeeType = [
    ['Cappucino', true],
    ['Latte', false],
    ['Milk', false],
    ['Chai', false],
  ];

  void handleSelection(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Icon(Icons.person),
          ),
        ],
        leading: Icon(Icons.menu),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text('Find the best coffee for you',
                style: GoogleFonts.bebasNeue(fontSize: 56)),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Find your coffee..',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade600,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 50,
              color: Colors.transparent,
              child: ListView.builder(
                itemCount: coffeeType.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CoffeeTypes(
                    coffeeTypeName: coffeeType[index][0],
                    isSelected: coffeeType[index][1],
                    onSelected: () {
                      handleSelection(index);
                    },
                  );
                },
              )),
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeeCard(
                imagePath: 'lib/images/latte.png',
                coffeeName: 'Latte',
                addOn: 'With Almond Milk',
                price: '10.0',
              ),
              CoffeeCard(
                imagePath: 'lib/images/cold.png',
                coffeeName: 'Cold Boost',
                addOn: 'With Chocolate Dip',
                price: '4.0',
              ),
              CoffeeCard(
                imagePath: 'lib/images/capucino.png',
                coffeeName: 'Cappucino',
                addOn: 'With a surprise',
                price: '15.0',
              ),
            ],
          )),
        ],
      ),
    );
  }
}
