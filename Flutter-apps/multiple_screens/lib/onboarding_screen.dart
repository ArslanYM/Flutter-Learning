import 'package:flutter/material.dart';
import 'package:multiple_screens/intro_screens/intro_screen1.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'home_page.dart';
import 'intro_screens/intro_screen2.dart';
import 'intro_screens/intro_screen3.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                isLast = (index == 2);
              });
            },
            controller: _controller,
            children: [
              IntroScreen1(),
              IntroScreen2(),
              IntroScreen3(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Text('skip',
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  effect: const WormEffect(),
                  count: 3,
                ),
                isLast
                    ? InkWell(
                        splashColor: Colors.deepPurple,
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return HomePage();
                          }));
                        },
                        child: Text(
                          'done',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease);
                        },
                        child: Text(
                          'next',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
