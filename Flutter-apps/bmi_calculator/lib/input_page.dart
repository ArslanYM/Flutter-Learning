import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final Color activeCardColor = Colors.grey.shade800;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: HomePageElement(
                    colour: activeCardColor,
                    cardChild: IconContent(
                      symbol: FontAwesomeIcons.mars,
                      label: "Male",
                    ),
                  ),
                ),
                Expanded(
                  child: HomePageElement(
                    colour: activeCardColor,
                    cardChild: IconContent(
                      symbol: FontAwesomeIcons.venus,
                      label: "Female",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: HomePageElement(
              colour: activeCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: HomePageElement(
                    colour: activeCardColor,
                  ),
                ),
                Expanded(
                  child: HomePageElement(
                    colour: activeCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.red,
            height: 80.0,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}

class IconContent extends StatelessWidget {
  IconContent({@required this.symbol, this.label});
  @override
  final IconData symbol;
  final String label;
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          symbol,
          size: 80.0,
          color: Colors.grey.shade200,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 15.0, color: Colors.grey.shade200),
        ),
      ],
    );
  }
}

class HomePageElement extends StatelessWidget {
  HomePageElement({@required this.colour, this.cardChild});
  final cardChild;
  final Color colour;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
