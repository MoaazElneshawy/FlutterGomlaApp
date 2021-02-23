import 'package:flutter/material.dart';
import 'package:gomla/presentation/cart/cartScreen.dart';
import 'package:gomla/presentation/contactUs/contactUsScreen.dart';
import 'package:gomla/presentation/home/home.dart';
import 'package:gomla/presentation/settings/settingsScreen.dart';

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[400],
        selectedItemColor: Colors.grey[800],
        unselectedItemColor: Colors.grey[800],
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.send_sharp), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: [HomeScreen(), CartScreen(), ContactUsScreen(), SettingsScreen()]
          .elementAt(currentIndex),
    );
  }
}
