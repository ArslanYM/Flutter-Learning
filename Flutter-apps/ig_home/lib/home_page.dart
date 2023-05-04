import 'package:flutter/material.dart';
import 'package:ig_home/circle.dart';
import 'package:ig_home/posts.dart';

class HomePage extends StatelessWidget {
  List<String> posts = [
    'post1',
    'post2',
    'post3',
    'post4',
    'post5',
  ];
  List<String> stories = [
    'story1',
    'story2',
    'story3',
    'story4',
    'story5',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Column(
          children: [
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length,
                itemBuilder: ((context, index) {
                  return Circle(
                    child: stories[index],
                  );
                }),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: ((context, index) {
                  return Posts(child: posts[index]);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
