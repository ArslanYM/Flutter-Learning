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
                    "https://media.licdn.com/dms/image/C4D03AQHQ8oDwQdzBWA/profile-displayphoto-shrink_800_800/0/1655544310526?e=1686182400&v=beta&t=lzs-xiIez_pp0DDAChrb-c85efQOZxYcTFYVz1cEZS4"),
              ),
              Text(
                'Arsalan Malik',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'ASPIRING DEVELOPER',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Source Sans Pro',
                  letterSpacing: 3,
                  color: Colors.teal.shade100,
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      '+91-9149689995',
                      style: TextStyle(
                        fontFamily: "Source Sans Pro",
                        color: Colors.teal.shade900,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.teal,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      'arsalanyaqmalik@gmail.com',
                      style: TextStyle(
                        fontFamily: "Source Sans Pro",
                        color: Colors.teal.shade900,
                        fontSize: 20,
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
