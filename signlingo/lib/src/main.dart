import 'package:flutter/material.dart';
import 'package:signlingo/src/header.dart';
import 'package:signlingo/src/resources/home/home.dart';

void main() {
  // runApp(const MyApp());

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  final pages = [
    Home(),
  ];
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        appBar: const Header(),
        body: pages[currentIndex],
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          indicatorColor: Colors.amber[800],
          selectedIndex: currentIndex,
          destinations: const <Widget>[
            NavigationDestination(
                icon: Icon(Icons.home_outlined), label: "Home"),
            NavigationDestination(
                icon: Icon(Icons.menu_book_outlined), label: "Trainer"),
            NavigationDestination(
                icon: Icon(Icons.list_alt_outlined), label: "Dictionary"),
            NavigationDestination(
                icon: Icon(Icons.settings_outlined), label: "Settings"),
          ],
        ),
      )),
    ));
    // ));
    // ));
  }
}
