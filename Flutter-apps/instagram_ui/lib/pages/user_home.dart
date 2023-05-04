import 'package:flutter/material.dart';
import 'package:instagram_ui/utils/circle.dart';
import 'package:instagram_ui/utils/posts.dart';

class UserHome extends StatelessWidget {
  UserHome({super.key});
  List stories = [
    'Story1',
    'Story2',
    'Story3',
    'Story3',
    'Story3',
    'Story3',
  ];
  List people = [
    'andrew22',
    'moomin_shafi',
    'sherjeel_amin',
    'arsalan_malik',
    'aqsa',
    'sass',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Instagram',
              style: TextStyle(color: Colors.black),
            ),
            Row(
              children: [
                Icon(Icons.add),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Icon(Icons.favorite),
                ),
                Icon(Icons.share),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Container(
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length,
              itemBuilder: (context, index) {
                return Circle(
                  text: stories[index],
                );
              },
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: people.length,
                  itemBuilder: (context, index) {
                    return MyPost(
                      text: people[index],
                    );
                  })),
        ],
      ),
    );
  }
}
