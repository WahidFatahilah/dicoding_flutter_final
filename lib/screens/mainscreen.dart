import 'package:newsappnewversion/screens/accountscreen.dart';
import 'package:newsappnewversion/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'homescreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedindex = 0;
  final _layoutpage = [
    const HomeScreen(),
    const ProfileScreen(),
  ];

  void _onTabItem(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _layoutpage.elementAt(_selectedindex),
      bottomNavigationBar: BottomNavigationBar(
        // ignore: prefer_const_literals_to_create_immutables
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
              icon: Icon(Icons.home), label: ("Home")),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person), label: ("Profile")),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedindex,
        onTap: _onTabItem,
      ),
    );
  }
}
