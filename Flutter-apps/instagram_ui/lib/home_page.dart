import 'package:flutter/material.dart';
import 'package:instagram_ui/pages/user_account.dart';
import 'package:instagram_ui/pages/user_home.dart';
import 'package:instagram_ui/pages/user_reels.dart';
import 'package:instagram_ui/pages/user_search.dart';
import 'package:instagram_ui/pages/user_shop.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _navigateBottomNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _children = [
    UserHome(),
    UserSearch(),
    UserReels(),
    UserShop(),
    UserAccount(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _navigateBottomNavBar,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.video_call), label: 'Reels'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Account'),
        ],
      ),
    );
  }
}
