import 'package:flutter/material.dart';
import 'package:neumorphic_music_app/song_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      home: SongPage(),
    );
  }
}
