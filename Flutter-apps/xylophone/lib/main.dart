import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNum) {
    final player = AudioPlayer();
    player.play(AssetSource('note$soundNum.wav'));
  }

  Expanded buildKey({required int soundNum, required Color color}) {
    return Expanded(
      child: TextButton(
        child: Container(child: Text("")),
        style: TextButton.styleFrom(backgroundColor: color),
        onPressed: () {
          playSound(soundNum);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(soundNum: 1, color: Colors.red),
              buildKey(soundNum: 2, color: Colors.blue),
              buildKey(soundNum: 3, color: Colors.green),
              buildKey(soundNum: 4, color: Colors.orange),
              buildKey(soundNum: 5, color: Colors.pink),
              buildKey(soundNum: 6, color: Colors.teal),
              buildKey(soundNum: 7, color: Colors.lime),
            ],
          ),
        ),
      ),
    );
  }
}
