import 'package:flutter/material.dart';
import 'package:instagram_ui/pages/account_tabs/acc_tab3.dart';
import 'package:instagram_ui/utils/circle.dart';

import 'account_tabs/acc_tab1.dart';
import 'account_tabs/acc_tab2.dart';
import 'account_tabs/acc_tab4.dart';
//TODO: create  a separate class for stories,people and other constant lists

class UserAccount extends StatelessWidget {
  UserAccount({super.key});
  List stories = [
    'Story1',
    'Story2',
    'Story3',
    'Story4',
    'Story5',
    'Story6',
    'Story6',
    'Story6',
    'Story6',
    'Story6',
    'Story6',
    'Story6',
    'Story6'
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ars1anm',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Row(
                children: [
                  Icon(Icons.add_box_outlined),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.menu)
                ],
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //pfp and followers
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        child: Image.network(
                            'https://avatars.githubusercontent.com/u/104521101?v=4'),
                        width: 100,
                        height: 100,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                '237',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text('Posts')
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '3090',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text('Followers')
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '40',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text('Following')
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'malik',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      'i create apps and games.',
                      style: TextStyle(),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      'www.arslanym.github',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Center(
                          child: Text('Edit Profile'),
                        ),
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey)),
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Expanded(
                      child: Container(
                        child: Center(
                          child: Text('Ad Tools'),
                        ),
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey)),
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Expanded(
                      child: Container(
                        child: Center(
                          child: Text('Insights'),
                        ),
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Circle(text: 'story1'),
                    Circle(text: 'story2'),
                    Circle(text: 'story3'),
                    Circle(text: 'story4'),
                  ],
                ),
              ),
              TabBar(
                tabs: [
                  Tab(
                    child: Icon(Icons.grid_3x3_outlined),
                  ),
                  Tab(
                    child: Icon(Icons.video_call_rounded),
                  ),
                  Tab(
                    child: Icon(Icons.play_arrow_sharp),
                  ),
                  Tab(
                    child: Icon(Icons.person_2_sharp),
                  ),
                ],
              ),
              Expanded(
                  child: TabBarView(children: [
                AccountTab1(),
                AccountTab2(),
                AccountTab3(),
                AccountTab4(),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
