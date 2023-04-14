import 'result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_page_element.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'bmi_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

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
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 20,
                      ),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      overlayColor: Colors.grey.shade50,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 0.0,
                      max: 300,
                      activeColor: Colors.white,
                      inactiveColor: Colors.grey,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
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
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                              fontSize: 15.0, color: Colors.grey.shade200),
                        ),
                        Text(
                          weight.toString(),
                          style: bigText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                                icon: FontAwesomeIcons.minus,
                                onTap: () {
                                  setState(() {
                                    if (weight == 0) {
                                      return;
                                    } else {
                                      weight--;
                                    }
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onTap: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: HomePageElement(
                    colour: inactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: TextStyle(
                              fontSize: 15.0, color: Colors.grey.shade200),
                        ),
                        Text(
                          age.toString(),
                          style: bigText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                                icon: FontAwesomeIcons.minus,
                                onTap: () {
                                  setState(() {
                                    if (age != 0) {
                                      age--;
                                    }
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onTap: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              BMIbrain calc = BMIbrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultPage(
                          bmi: calc.calculateBMI(),
                          bmiResult: calc.getResult(),
                          interpret: calc.getInterpretation(),
                        )),
              );
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 10,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              color: Colors.black54,
              height: 80.0,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({this.icon, @required this.onTap});
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      onPressed: onTap,
      shape: CircleBorder(),
      fillColor: Colors.white,
      child: Icon(
        icon,
        color: Colors.grey.shade700,
      ),
      elevation: 6.0,
    );
  }
}
