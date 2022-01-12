import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/screens/home_screen/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: primaryColor,
          foregroundColor: primaryLightColor,
          title: Text(
            "Chef's Special",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.settings, size: 30)),
          ],
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu, size: 35),
          ),
        ),
        body: HomeScreenBody(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: primaryColor,
          selectedItemColor: primaryDarkColor,
          unselectedItemColor: primaryLightColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.email),
              label: "Notifications",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Account",
            ),
          ],
        ),
      ),
    );
  }
}
