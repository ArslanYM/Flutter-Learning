import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';
import 'home_page_element.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmi, @required this.bmiResult, @required this.interpret});
  final String bmi;
  final String bmiResult;
  final String interpret;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black38,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Your Result",
              style: TextStyle(fontSize: 40),
            ),
            Expanded(
              child: HomePageElement(
                colour: Colors.grey.shade700,
                cardChild: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        bmi,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.green,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                        bmiResult.toUpperCase(),
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                        interpret,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Center(
                  child: Text(
                    'RECALCULATE',
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
      ),
    );
  }
}
