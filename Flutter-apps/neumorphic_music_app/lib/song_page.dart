import 'package:flutter/material.dart';
import 'package:neumorphic_music_app/neu_box.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SongPage extends StatefulWidget {
  const SongPage({super.key});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(
                      height: 60,
                      width: 60,
                      child: NeuBox(
                          child: Icon(
                        Icons.arrow_back,
                      ))),
                  Text('P L A Y L I S T'),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: NeuBox(
                      child: Icon(
                        Icons.menu,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),

              //cover art
              NeuBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset('lib/images/cover.jpg')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Anarchy',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                'Pistols',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade900,
                                ),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 32,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text('0.00'),
                  Icon(Icons.shuffle),
                  Icon(Icons.repeat),
                  Text('4.22'),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              NeuBox(
                child: LinearPercentIndicator(
                  lineHeight: 10,
                  percent: 0.5,
                  progressColor: Colors.green,
                  backgroundColor: Colors.transparent,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              SizedBox(
                height: 80,
                child: Row(
                  children: [
                    Expanded(
                      child: NeuBox(
                        child: Icon(
                          Icons.skip_previous,
                          size: 32,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: NeuBox(
                            child: Icon(
                          Icons.play_arrow,
                          size: 32,
                        )),
                      ),
                    ),
                    Expanded(
                      child: NeuBox(
                        child: Icon(
                          Icons.skip_next,
                          size: 32,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
