import 'package:flutter/material.dart';
import 'package:signlingo/header.dart';
import 'package:signlingo/home/home.dart';

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
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        appBar: const Header(),
        body: <Widget>[
          const Home(),
          Container(
            color: Colors.green,
            alignment: Alignment.center,
            child: const Text('Page 2'),
          ),
          Container(
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text('Page 3'),
          ),
          Container(
            color: Colors.red,
            alignment: Alignment.center,
            child: const Text('Page 4'),
          )
        ][currentIndex],
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
