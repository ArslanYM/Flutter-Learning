import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(
                    "https://media.licdn.com/dms/image/C4D03AQHQ8oDwQdzBWA/profile-displayphoto-shrink_800_800/0/1655544310526?e=1686182400&v=beta&t=lzs-xiIez_pp0DDAChrb-c85efQOZxYcTFYVz1cEZS4" ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
