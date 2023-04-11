import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_page_element.dart';
import 'icon_content.dart';
import 'constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        centerTitle: true,
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: HomePageElement(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconContent(
                      symbol: FontAwesomeIcons.mars,
                      label: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: HomePageElement(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconContent(
                      symbol: FontAwesomeIcons.venus,
                      label: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: HomePageElement(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style:
                        TextStyle(fontSize: 15.0, color: Colors.grey.shade200),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: bigText,
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                            fontSize: 15.0, color: Colors.grey.shade200),
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 0,
                    max: 300,
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  )
                ],
              ),
              colour: inactiveCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: HomePageElement(
                    colour: inactiveCardColor,
                  ),
                ),
                Expanded(
                  child: HomePageElement(
                    colour: inactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.black54,
            height: 80.0,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
