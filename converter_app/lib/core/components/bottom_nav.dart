import 'package:converter_app/screens/bids_page.dart';
import 'package:converter_app/screens/home_page.dart';
import 'package:converter_app/screens/settings.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  late List pages;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    pages = [HomePage(), BidsPage(), SettingsPage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepPurple,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: "Wallet",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets_outlined),
            label: "Bids",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: "Settings",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (i) {
          setState(() {
            _currentIndex = i;
          });
        },
      ),
      body: pages[_currentIndex],
    );
  }
}
